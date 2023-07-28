import { User } from 'user/user.entity'
import { TypeOrmModuleOptions } from '@nestjs/typeorm'

const config: TypeOrmModuleOptions = {
  type: 'mariadb',
  host: 'localhost',
  port: 33061,
  username: 'server',
  password: 'qwerty123',
  database: 'cash',
  entities: [User],
  synchronize: true,
}
export default config
