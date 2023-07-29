import { Injectable, NotFoundException } from '@nestjs/common'
import { InjectRepository } from '@nestjs/typeorm'
import { Repository } from 'typeorm'
import { User } from 'user/user.entity'

@Injectable()
export class UserService {
  constructor(
    @InjectRepository(User)
    private userRepository: Repository<User>,
  ) {}

  async login(id: string, pw: string): Promise<number> {
    const search = {
      id: id.trim(),
      pw: pw.trim().toLowerCase(),
    }
    const user = await this.userRepository.findOne({ where: search })

    if (user) {
      return user.seq
    }
    throw new NotFoundException(`login fail`)
  }
}
