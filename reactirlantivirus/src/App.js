import './App.css';
import { Routes, Route } from 'react-router-dom';
import Login from "./components/Login"; 

function App() {
  return (
    <div className="App">
      <Routes>
        <Route path="/login" element={<Login />} /> {/* Changed 'login' to 'Login' */}
      </Routes>
    </div>
  );
}

export default App;
