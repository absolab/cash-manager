import layout from 'assets/css/layout'
import styled from 'styled-components'

const Layout = styled.div`
  width: 100%;
  position: sticky;
  top: 0;
  z-index: 100;
  height: ${layout.headerHeight};
  background-color: aqua;
`
export { Layout }
