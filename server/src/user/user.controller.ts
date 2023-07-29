import { Body, Controller, Post } from '@nestjs/common'
import { UserService } from './user.service'

@Controller('user')
class UserController {
  constructor(private readonly userService: UserService) {}

  @Post('login')
  login(@Body('id') id: string, @Body('pw') pw: string): Promise<number> {
    // 나중에 세션이나 토큰 처리도 해줘야지
    return this.userService.login(id, pw)
  }
}

export { UserController }
