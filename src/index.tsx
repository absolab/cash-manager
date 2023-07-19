import React from 'react';
import ReactDOM from 'react-dom/client';
import 'assets/css/style.css';
import reportWebVitals from 'reportWebVitals';
import { MainLayout, LoginLayout } from 'layouts';
import { BrowserRouter, Route, Routes } from 'react-router-dom';

const root = ReactDOM.createRoot(
  document.getElementById('root') as HTMLElement
);
root.render(
  <BrowserRouter>
      <Routes>
        <Route path="/login" element={<LoginLayout/>} />
        <Route path="/*" element={<MainLayout/>} />
      </Routes>
  </BrowserRouter>
);

// If you want to start measuring performance in your app, pass a function
// to log results (for example: reportWebVitals(console.log))
// or send to an analytics endpoint. Learn more: https://bit.ly/CRA-vitals
reportWebVitals();
