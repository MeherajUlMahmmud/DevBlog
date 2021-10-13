import React from "react";
import "./register.css";
import { Link } from "react-router-dom";

const RegisterScreen = () => {
  return (
    <div className="register">
      <span className="registerTitle">register</span>
      <form className="registerForm">
        <label>Username</label>
        <input
          type="email"
          className="registerInput"
          placeholder="Enter your username"
        />

        <label>Email</label>
        <input
          type="email"
          className="registerInput"
          placeholder="user@xyz.com"
        />

        <label>Password</label>
        <input
          type="password"
          className="registerInput"
          placeholder="Password"
        />
        <button className="registerButton">Register</button>
      </form>
      <button className="registerLoginButton">
        <Link to="/login" className="link">
          Login
        </Link>
      </button>
    </div>
  );
};

export default RegisterScreen;
