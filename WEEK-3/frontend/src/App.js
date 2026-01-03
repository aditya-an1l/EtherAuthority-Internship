import React, { useState } from "react";
import { BrowserRouter as Router, Routes, Route } from "react-router-dom";

import ConnectWallet from "./components/ConnectWallet";
import StakeWidget from "./components/StakeWidget";

function App() {
  const [walletCtx, setWalletCtx] = useState(null);

  return (
    <Router>
      <div className="min-h-screen bg-gradient-to-br from-black via-gray-900 to-black text-white">
        
        {/* ===== Header ===== */}
        <header className="flex justify-between items-center px-8 py-6 border-b border-gray-800">
          <div>
            <h1 className="text-2xl font-bold tracking-wide">
              Decentralized Staking DApp
            </h1>
            <p className="text-sm text-gray-400">
              Built by <span className="text-purple-400">aditya-an1l</span> · EtherAuthority Internship · Week 3
            </p>
          </div>

          <ConnectWallet onConnect={setWalletCtx} />
        </header>

        {/* ===== Main Content ===== */}
        <main className="max-w-4xl mx-auto px-6 py-12">
          <Routes>
            <Route
              path="/"
              element={
                <div className="bg-gray-900/60 backdrop-blur-xl border border-gray-800 rounded-2xl shadow-xl p-8">
                  <h2 className="text-xl font-semibold mb-4">
                    Stake Your Tokens
                  </h2>

                  <p className="text-gray-400 mb-6">
                    Securely stake ERC-20 tokens using smart contracts deployed on Ethereum testnet.
                  </p>

                  {/* ✅ Correct prop passing (NO comments inside JSX) */}
                  <StakeWidget providerCtx={walletCtx} />
                </div>
              }
            />
          </Routes>
        </main>

        {/* ===== Footer ===== */}
        <footer className="text-center text-gray-500 text-sm py-6 border-t border-gray-800">
          © 2026 · Web3 & DeFi Full-Stack Project · Built with React, Ethers.js & Solidity
        </footer>
      </div>
    </Router>
  );
}

export default App;
