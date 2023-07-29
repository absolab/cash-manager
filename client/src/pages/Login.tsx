import loginApi from 'apis/loginApi'
import color from 'assets/css/color'
import { useState } from 'react'
import { styled } from 'styled-components'

const Login = () => {
  const [userId, setUserId] = useState('')
  const [password, setPassword] = useState('')

  return (
    <Wrapper>
      <Box>
        <Input
          type="text"
          value={userId}
          placeholder="아이디"
          onChange={(e) => {
            setUserId(e.target.value)
          }}
        />
        <Input
          type="password"
          value={password}
          placeholder="비밀번호"
          onChange={(e) => {
            setPassword(e.target.value)
          }}
        />
        <Button
          type="button"
          onClick={async () => {
            const res = await loginApi.login(userId, password)
            console.log(res)
          }}
        >
          로그인
        </Button>
      </Box>
    </Wrapper>
  )
}

export default Login

// style
const Wrapper = styled.div`
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  height: 100%;
  background-image: url(images/bg-login.jpeg);
  background-size: cover;
`
const Box = styled.div`
  display: flex;
  flex-direction: column;
  width: 250px;
  padding: 10px;
  border-radius: 5px;
  background-color: ${color.primary.light};
`
const Input = styled.input`
  padding: 5px;
  margin: 5px 0;
  :focus {
    border-color: ${color.primary.dark};
  }
`

const Button = styled.button`
  padding: 5px;
  margin: 5px auto;
  width: 80px;
`
