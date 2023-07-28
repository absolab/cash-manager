import { Injectable, NotFoundException } from '@nestjs/common'
import { InjectRepository } from '@nestjs/typeorm'
import { Repository } from 'typeorm'
import { User } from 'user/user.entity'

@Injectable()
export class UserService {
  constructor(
    @InjectRepository(User)
    private usersRepository: Repository<User>,
  ) {}

  getAll(): Promise<User[]> {
    return this.usersRepository.find()
  }

  // getOne(id: string): Promise<User | null> {
  //   return this.usersRepository.findOneBy({ id })
  //   // if (!user) {
  //   //   throw new NotFoundException(`user id ${id} not found`)
  //   // }
  // }
}
