import './App.css';
import { Routes, Route } from 'react-router-dom';
import Login from "./components/Login"; 
import Signup from "./components/Signup"; 
import Forgot_Password from "./components/Forgot_Password"
import Forgot_Password_Success from "./components/Forgot_Password_Success"
import Home from "./components/Home";
import About_Us from "./components/About_Us";
import Patient_Care_And_Treatment from "./components/Patient_Care_And_Treatment";
import Patient_And_Visitor_Info from "./components/Patient_And_Visitor_Info";
function App() {
  return (
    <div className="App">
      <Routes>
        <Route path= "/" element={<Home/>}/>
        <Route path="/login" element={<Login />} /> {/* Changed 'login' to 'Login' */}
        <Route path="/signup" element={<Signup />} /> {/* Changed 'login' to 'Login' */}
        <Route path="/forgot-password" element={<Forgot_Password/> }/>
        <Route path="/forgot-password-success" element={<Forgot_Password_Success/>}/>
        <Route path="/about-us" element={<About_Us/>}/>
        <Route path= "/patient-care-and-treatment" element={<Patient_Care_And_Treatment/>}/>
        <Route path= "/patient-and-visitor-info" element={<Patient_And_Visitor_Info/>}/>
      </Routes>
    </div>
  );
}

export default App;
