const config = () => {
  const host = 'localhost'
  const port = 3000
  const pre = '/api'

  return {
    getHost: () => {
      return 'http://' + host + ':' + port + pre
    },
    success: (data: unknown) => {
      return {
        result: true,
        data: data,
      }
    },
    fail: () => {
      return {
        result: false,
      }
    },
  }
}

export default config
