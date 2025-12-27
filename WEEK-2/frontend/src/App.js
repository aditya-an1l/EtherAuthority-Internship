import React from 'react';
import { BrowserRouter as Router, Route, Routes, Link } from 'react-router-dom';
import Dashboard from './components/Dashboard'; 
import RegisterIntern from './components/RegisterIntern';
import SubmitTask from './components/SubmitTask';
import MintNFT from './components/MintNFT';
import './App.css'; 

function App() {
  return (
    <Router>
      <div className="app-container">
        <header>
          <h1>Internship Reward DApp</h1>
          <nav>
            <Link to="/">Dashboard</Link> | 
            <Link to="/register"> Register Intern</Link> | 
            <Link to="/submit-task"> Submit Task</Link> | 
            <Link to="/mint-nft"> Mint NFT</Link>
          </nav>
        </header>
        <main>
          <Routes>
            <Route path="/" element={<Dashboard />} /> {/* New default route */}
            <Route path="/register" element={<RegisterIntern />} />
            <Route path="/submit-task" element={<SubmitTask />} />
            <Route path="/mint-nft" element={<MintNFT />} />
          </Routes>
        </main>
      </div>
    </Router>
  );
}

export default App;
