import axios from 'axios'
import config from './config'

// 유틸로 빼는것도 고려
const sha512 = async (data: string) => {
  const encoder = new TextEncoder()
  const dataBuffer = encoder.encode(data)
  const hashBuffer = await crypto.subtle.digest('SHA-512', dataBuffer)
  const hashArray = Array.from(new Uint8Array(hashBuffer))
  const hashHex = hashArray.map((byte) => byte.toString(16).padStart(2, '0')).join('')
  return hashHex
}

const loginApi = {
  login: async (id: string, pw: string) => {
    const data = {
      id,
      pw: await sha512(pw),
    }
    try {
      const res = await axios.post(config().getHost() + '/user/login', data)
      return config().success(res.data)
    } catch (_) {
      return config().fail()
    }
  },
}
export default loginApi
