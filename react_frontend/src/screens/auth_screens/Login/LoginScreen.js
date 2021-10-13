import React from 'react'
import "./login.css";
import { Link } from "react-router-dom";

const LoginScreen = () => {
  return (
    <div className="login">
      <span className="loginTitle">Login</span>
      <form className="loginForm">
        <label>Email</label>
        <input type="email" className="loginInput" placeholder="user@xyz.com" />
        <label>Password</label>
        <input type="password" className="loginInput" placeholder="Password" />
        <button className="loginButton">Login</button>
      </form>
      <button className="loginRegisterButton">
        <Link to="/register" className="link">
          Register
        </Link>
      </button>
    </div>
  );
};

export default LoginScreen
