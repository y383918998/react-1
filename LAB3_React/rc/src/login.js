/* eslint-disable jsx-a11y/anchor-is-valid */
// src/Login.js
import React, { useState } from 'react';
import { Link, useNavigate } from 'react-router-dom';
import './login.css';

const Login = () => {
    const navigate = useNavigate();
    const [username, setUsername] = useState('');
    const [password, setPassword] = useState('');
    const handleLogin = async () => {
     
        const response = await fetch('http://localhost:57060/api/Login', {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json',
          },
          body: JSON.stringify({ username, password }),
        });
        if (response.ok) {
            const data = await response.json();
            if(data.Status===true)
            {
              
              localStorage.setItem('isLoggedIn', 'true');
              localStorage.setItem('uid', data.Data.Id);
              navigate('/home');
            }
            else
            {
                //失败
                alert(data.Msg);
            }
          // 模拟登录成功后的操作
           
        } else {
          // 模拟登录失败的操作
          console.error('登录失败');
        }
    };
  return (
    <div>
      <h2>Login</h2>
      <form>
        <label>
          Username:
          <input
            type="text"
            value={username}
            onChange={(e) => setUsername(e.target.value)}
          />
        </label>
        <br />
        <label>
          Password:
          <input
            type="password"
            value={password}
            onChange={(e) => setPassword(e.target.value)}
          />
        </label>
        <br />
        <button type="button" onClick={handleLogin}>
          Login
        </button>
        <Link to="/register">Go to Register</Link>
       
      </form>
    </div>
  );
};

export default Login;
