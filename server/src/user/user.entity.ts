import { BaseEntity, Column, Entity, PrimaryGeneratedColumn } from 'typeorm'

@Entity('TB_USER')
class User extends BaseEntity {
  @PrimaryGeneratedColumn()
  seq: number

  // { unique: true }
  @Column()
  id: string

  @Column()
  pw: string
}

export { User }
