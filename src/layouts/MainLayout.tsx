import { useNavigate } from "react-router-dom"

const MainLayout = () => {

    const navigate = useNavigate();

    return (
        <div>
            메인 레이아웃입니다
            <button type="button" onClick={() => navigate('/login')}>로그인으로 이동</button>
        </div>
    )
}

export default MainLayout