import React, { useState } from 'react';
import { ethers } from 'ethers';
import ConnectWallet from '../components/ConnectWallet';
import { getStakingContract } from '../utils/contract';

export default function Dashboard() {
  const [ctx, setCtx] = useState(null);
  const [stakeAmount, setStakeAmount] = useState('');

  async function onConnect(c) {
    setCtx(c);
  }

  async function doApproveAndStake() {
    if (!ctx) return alert('connect');
    const { signer } = ctx;
    const stakingAddress = process.env.REACT_APP_STAKING_ADDRESS;
    const tokenAddress = process.env.REACT_APP_STAKING_TOKEN_ADDRESS;

    const tokenAbi = [ 'function approve(address spender, uint256 amount) public returns (bool)' ];
    const tokenContract = new ethers.Contract(tokenAddress, tokenAbi, signer);
    const staking = getStakingContract(stakingAddress, signer);

    const amountWei = ethers.parseUnits(stakeAmount || '0', 18);
    await tokenContract.approve(stakingAddress, amountWei);
    const tx = await staking.stake(amountWei);
    await tx.wait();
    alert('staked');
  }

  return (
    <div>
      <ConnectWallet onConnect={onConnect} />
      <div>
        <input value={stakeAmount} onChange={(e) => setStakeAmount(e.target.value)} placeholder="amount" />
        <button onClick={doApproveAndStake}>Approve & Stake</button>
      </div>
    </div>
  );
}
