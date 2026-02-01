import { Body, Controller, Get, Post, Req, Res, UseGuards } from '@nestjs/common';
import type { Request, Response } from 'express';
import { AuthService } from './auth.service';
import { LoginDto } from './dto/login.dto';
import { RegisterDto } from './dto/register.dto';
import { JwtAuthGuard } from './guards/jwt-auth.guard';

@Controller('auth')
export class AuthController {
  constructor(private readonly authService: AuthService) {}

  private parseDurationToSeconds(value: string, fallbackSeconds: number) {
    const raw = value.trim();
    if (!raw) return fallbackSeconds;
    if (/^\d+$/.test(raw)) return Number(raw);
    const match = raw.match(/^(\d+)([smhd])$/i);
    if (!match) return fallbackSeconds;
    const amount = Number(match[1]);
    const unit = match[2].toLowerCase();
    const multipliers: Record<string, number> = {
      s: 1,
      m: 60,
      h: 3600,
      d: 86400,
    };
    return amount * (multipliers[unit] ?? fallbackSeconds);
  }

  private setAuthCookies(res: Response, accessToken: string, refreshToken: string) {
    const isProd = process.env.NODE_ENV === 'production';
    const accessMaxAge = this.parseDurationToSeconds(
      process.env.JWT_ACCESS_EXPIRES_IN ?? '15m',
      15 * 60,
    );
    const refreshMaxAge = this.parseDurationToSeconds(
      process.env.JWT_REFRESH_EXPIRES_IN ?? '7d',
      7 * 86400,
    );
    const baseOptions = {
      httpOnly: true,
      secure: isProd,
      sameSite: isProd ? 'none' : 'lax',
      path: '/',
    } as const;

    res.cookie('access_token', accessToken, {
      ...baseOptions,
      maxAge: accessMaxAge * 1000,
    });
    res.cookie('refresh_token', refreshToken, {
      ...baseOptions,
      maxAge: refreshMaxAge * 1000,
    });
  }

  private clearAuthCookies(res: Response) {
    const isProd = process.env.NODE_ENV === 'production';
    const baseOptions = {
      httpOnly: true,
      secure: isProd,
      sameSite: isProd ? 'none' : 'lax',
      path: '/',
    } as const;
    res.cookie('access_token', '', { ...baseOptions, maxAge: 0 });
    res.cookie('refresh_token', '', { ...baseOptions, maxAge: 0 });
  }

  private getCookie(req: Request, name: string) {
    const raw = req.headers?.cookie ?? '';
    if (!raw) return null;
    const pair = raw
      .split(';')
      .map((chunk) => chunk.trim())
      .find((chunk) => chunk.startsWith(`${name}=`));
    if (!pair) return null;
    return decodeURIComponent(pair.split('=').slice(1).join('='));
  }

  @Post('register')
  register(@Body() dto: RegisterDto) {
    return this.authService.register(dto);
  }

  @Post('login')
  async login(
    @Body() dto: LoginDto,
    @Res({ passthrough: true }) res: Response,
  ) {
    const result = await this.authService.login(dto);
    this.setAuthCookies(res, result.accessToken, result.refreshToken);
    return {
      mustChangePassword: result.mustChangePassword,
      accessToken: result.accessToken,
    };
  }

  @Post('refresh')
  async refresh(@Req() req: Request, @Res({ passthrough: true }) res: Response) {
    const refreshToken = this.getCookie(req, 'refresh_token');
    const result = await this.authService.refreshSession(refreshToken ?? '');
    this.setAuthCookies(res, result.accessToken, result.refreshToken);
    return { refreshed: true, mustChangePassword: result.mustChangePassword };
  }

  @Post('logout')
  async logout(@Req() req: Request, @Res({ passthrough: true }) res: Response) {
    const refreshToken = this.getCookie(req, 'refresh_token');
    if (refreshToken) {
      await this.authService.logoutByRefreshToken(refreshToken);
    }
    this.clearAuthCookies(res);
    return { loggedOut: true };
  }

  @Post('change-password')
  @UseGuards(JwtAuthGuard)
  changePassword(
    @Req() req: Request,
    @Body() body: { currentPassword?: string; newPassword: string },
  ) {
    return this.authService.changePassword(req['user'].sub, body);
  }

  @Get('me')
  @UseGuards(JwtAuthGuard)
  me(@Req() req: Request) {
    return this.authService.getMe(req['user'].sub);
  }
}
