import React, { useState, useEffect } from 'react';
import { ethers } from 'ethers';

export default function ConnectWallet({ onConnect }) {
  const [addr, setAddr] = useState(null);

  async function connect() {
    try {
      if (!window.ethereum) return alert('Install MetaMask');
      await window.ethereum.request({ method: 'eth_requestAccounts' });
      const provider = new ethers.BrowserProvider(window.ethereum);
      const signer = await provider.getSigner();
      const address = await signer.getAddress();
      setAddr(address);
      onConnect({ provider, signer, address });
    } catch (err) {
      console.error(err);
      alert('Connection failed');
    }
  }

  return (
    <div className="flex items-center gap-3">
      <button onClick={connect} className="btn-accent px-4 py-2">
        {addr ? (String(addr).slice(0,6) + '...' + String(addr).slice(-4)) : 'Connect Wallet'}
      </button>
      <div className="muted small">{addr ? 'Wallet connected' : 'Not connected'}</div>
    </div>
  );
}
