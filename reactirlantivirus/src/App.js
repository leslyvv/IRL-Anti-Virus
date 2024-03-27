import './App.css';
import { Routes, Route } from 'react-router-dom';
import Login from "./components/Login"; 
import Signup from "./components/Signup"; 
import Forgot_Password from "./components/Forgot_Password"
import Forgot_Password_Success from "./components/Forgot_Password_Success"

function App() {
  return (
    <div className="App">
      <Routes>
        <Route path="/login" element={<Login />} /> {/* Changed 'login' to 'Login' */}
        <Route path="/signup" element={<Signup />} /> {/* Changed 'login' to 'Login' */}
        <Route path="/forgot-password" element={<Forgot_Password/> }/>
        <Route path="/forgot-password-success" element={<Forgot_Password_Success/>}/>

      </Routes>
    </div>
  );
}

export default App;
