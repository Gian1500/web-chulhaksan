import {
  CanActivate,
  ExecutionContext,
  Injectable,
  UnauthorizedException,
} from '@nestjs/common';
import { JwtService } from '@nestjs/jwt';

@Injectable()
export class JwtAuthGuard implements CanActivate {
  constructor(private readonly jwtService: JwtService) {}

  private getCookieValue(raw: string | undefined, name: string) {
    if (!raw) return null;
    const pair = raw
      .split(';')
      .map((chunk) => chunk.trim())
      .find((chunk) => chunk.startsWith(`${name}=`));
    if (!pair) return null;
    return decodeURIComponent(pair.split('=').slice(1).join('='));
  }

  async canActivate(context: ExecutionContext): Promise<boolean> {
    const request = context.switchToHttp().getRequest();
    const authHeader = request.headers?.authorization ?? '';
    const [type, headerToken] = authHeader.split(' ');
    let token = '';

    if (type === 'Bearer' && headerToken) {
      token = headerToken;
    } else {
      token =
        this.getCookieValue(request.headers?.cookie, 'access_token') ?? '';
    }

    if (!token) {
      throw new UnauthorizedException('Token requerido.');
    }

    try {
      const payload = await this.jwtService.verifyAsync(token);
      request.user = payload;
      return true;
    } catch {
      throw new UnauthorizedException('Token invalido.');
    }
  }
}
