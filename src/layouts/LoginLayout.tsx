import { useNavigate } from 'react-router-dom'

const LoginLayout = () => {
  const naviagte = useNavigate()
  return (
    <div>
      로그인 레이아웃입니다
      <button type="button" onClick={() => naviagte('/')}>
        메인으로 이동
      </button>
    </div>
  )
}

export default LoginLayout
