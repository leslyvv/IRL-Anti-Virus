import React from 'react';
import {Link} from "react-router-dom"
import userIcon from './user_icon.png'; // Import the user icon image
import keyIcon from './key_pwd.png';
import './Login.css'; // Import your CSS file

const Login = () => {
  return (
    <div className="account-container">
      <form>
          <div className="login-header">
            Login
          </div>
          <div className="form-container">
            <p className="username-section">
              <input className="user-box" type="text" placeholder="Enter Username" pattern="^[a-zA-Z0-9](_(?!(\.|_))|\.(?!(_|\.))|[a-zA-Z0-9]){6,18}[a-zA-Z0-9]$" required />
              <img className="user-pic" src={userIcon} alt="User Icon" />
            </p>
            <p className="password-section">
              <input className="password-box" type="password" placeholder="Enter Password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{7,}" required />
              <img className="key-pic" src={keyIcon} alt="Key Icon" />
            </p>
          </div>
          <div className="form-subcontainer">
            <p className="forgot-password">
              <Link to ="/forgot-password">Forgot password?</Link>
            </p>
          </div>
          <div className="submission">
            <button className="login-button">Login</button>
            <p className="register">
              Not a registered user? <a href="signup">Register here!</a>
            </p>
          </div>        
      </form>
      </div>  
  );
};

export default Login;
