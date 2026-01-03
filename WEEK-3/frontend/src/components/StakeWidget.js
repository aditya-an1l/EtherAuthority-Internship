import React, { useState, useEffect } from 'react';
import { ethers } from 'ethers';
import { getStakingContract } from '../utils/contract';

export default function StakeWidget({ providerCtx }) {
  const [signer, setSigner] = useState(null);
  const [address, setAddress] = useState(null);
  const [amount, setAmount] = useState('');
  const [loading, setLoading] = useState(false);

  useEffect(() => {
    if (providerCtx?.signer) {
      setSigner(providerCtx.signer);
      setAddress(providerCtx.address);
    }
  }, [providerCtx]);

  async function approveAndStake() {
    if (!signer) return alert('Connect wallet first');
    const stakingAddress = process.env.REACT_APP_STAKING_ADDRESS;
    const tokenAddress = process.env.REACT_APP_STAKING_TOKEN_ADDRESS;
    try {
      setLoading(true);
      const tokenAbi = ['function approve(address spender, uint256 amount) public returns (bool)'];
      const tokenContract = new ethers.Contract(tokenAddress, tokenAbi, signer);
      const staking = getStakingContract(stakingAddress, signer);
      const amountWei = ethers.parseUnits(amount || '0', 18);

      const tx1 = await tokenContract.approve(stakingAddress, amountWei);
      await tx1.wait();
      const tx2 = await staking.stake(amountWei);
      await tx2.wait();
      alert('Staked successfully');
    } catch (err) {
      console.error(err);
      alert('Tx failed: ' + (err?.message || err));
    } finally {
      setLoading(false);
    }
  }

  return (
    <div className="p-6">
      <div className="flex items-center justify-between mb-4">
        <div>
          <div className="muted small">Account</div>
          <div className="font-semibold">{address ? String(address).slice(0,6) + '...' + String(address).slice(-4) : 'Not connected' }</div>
        </div>
        <div className="text-right">
          <div className="muted small">Network</div>
          <div className="font-semibold">Sepolia</div>
        </div>
      </div>

      <div className="mb-4">
        <label className="muted small">Amount to stake</label>
        <input value={amount} onChange={(e)=>setAmount(e.target.value)} className="w-full mt-2 p-3 rounded-md bg-transparent border border-white/10" placeholder="e.g. 12.5" />
      </div>

      <div className="flex gap-3">
        <button onClick={approveAndStake} disabled={loading} className="btn-accent">
          {loading ? 'Processing...' : 'Approve & Stake'}
        </button>
        <button className="px-4 py-2 border rounded-md">Estimate Gas</button>
      </div>
      <div className="mt-4 muted small">Tip: Approve first then stake. Your txs will show in the transaction feed.</div>
    </div>
  );
}
