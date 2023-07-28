import { Module } from '@nestjs/common'
import { UserModule } from 'user/user.module'
import { TypeOrmModule } from '@nestjs/typeorm'
import dbconfig from 'config/db.config'

@Module({
  imports: [TypeOrmModule.forRoot(dbconfig), UserModule],
  controllers: [],
  providers: [],
})
export class AppModule {}
