import React from 'react';
import { Link } from 'react-router-dom';

function Dashboard() {
  return (
    <div className="dashboard">
      <h2>Welcome to the Internship Reward DApp</h2>
      <p>Manage interns, track tasks, and mint rewards/NFTs on the blockchain.</p>
      <div className="dashboard-links">
        <Link to="/register" className="btn">Register a New Intern</Link>
        <Link to="/submit-task" className="btn">Submit a Task</Link>
        <Link to="/mint-nft" className="btn">Mint an NFT</Link>
      </div>
      <div className="features">
        <h3>Features</h3>
        <ul>
          <li><strong>ERC20 Tokens:</strong> Reward interns with Intern Reward, Task Completion, or Attendance Tokens.</li>
          <li><strong>ERC721 NFTs:</strong> Issue Internship Certificates, Course Completion badges, or Achievement Badges.</li>
          <li><strong>Database:</strong> Track interns, tasks, and NFT records in MongoDB.</li>
          <li><strong>Blockchain:</strong> All transactions on Ethereum Sepolia (testnet).</li>
        </ul>
      </div>
    </div>
  );
}

export default Dashboard;
