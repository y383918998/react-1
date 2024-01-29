// App.js
import React, { useState } from 'react';
import { BrowserRouter as Router, Routes, Route,Navigate  } from 'react-router-dom';
import Login from './login';
import Home from './home';
import Register from './register';
import View from './view';

const App = () => {

  const [isLoggedIn, setIsLoggedIn] = useState(false);
  return (
    <Router>
    <Routes>
      {/* 如果已经登录，直接跳转到首页，否则显示登录页面 */}
      <Route
        path="/"
        element={isLoggedIn ? <Navigate to="/home" /> : <Navigate to="/login" />}
      />
      <Route path="/login" element={<Login setIsLoggedIn={setIsLoggedIn} />} />
      <Route path="/home" element={<Home />} />
      <Route path="/register" element={<Register />} />
      <Route path="/View" element={<View />} />
    </Routes>
  </Router>

  );
};

export default App;
