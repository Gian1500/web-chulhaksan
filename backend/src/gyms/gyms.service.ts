import { Injectable } from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';

@Injectable()
export class GymsService {
  constructor(private readonly prisma: PrismaService) {}

  async list() {
    return this.prisma.gym.findMany({
      select: { id: true, name: true },
      orderBy: { name: 'asc' },
    });
  }
}

