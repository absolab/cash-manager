import { Controller, Get, Param } from '@nestjs/common'
import { UserService } from 'user/user.service'
import { User } from 'user/user.entity'

@Controller('user')
class UserController {
  constructor(private readonly userService: UserService) {}

  @Get()
  getAll(): Promise<User[]> {
    return this.userService.getAll()
  }

  // @Get('/:id')
  // getOne(@Param('id') userId: string): Promise<User | null> {
  //   return this.userService.getOne(userId)
  // }
}

export { UserController }
