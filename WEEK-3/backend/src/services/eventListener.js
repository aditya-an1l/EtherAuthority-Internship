import { ethers } from 'ethers';
import dotenv from 'dotenv';
import User from '../models/User.js';

dotenv.config();

export default function startEventListener() {
  const provider = new ethers.JsonRpcProvider(process.env.SEPOLIA_RPC_URL);
  const stakingAddress = process.env.STAKING_CONTRACT_ADDRESS;
  if (!stakingAddress) return console.log('No staking address set for event listener');

  // Minimal ABI for events
  const abi = [
    'event Staked(address indexed user, uint256 amount)',
    'event Withdrawn(address indexed user, uint256 amount)',
    'event RewardPaid(address indexed user, uint256 reward)'
  ];

  const contract = new ethers.Contract(stakingAddress, abi, provider);

  contract.on('Staked', (user, amount, evt) => {
    console.log('Staked', user, amount.toString());
    // optional: write to DB for analytics
  });

  contract.on('Withdrawn', (user, amount) => {
    console.log('Withdrawn', user, amount.toString());
  });

  contract.on('RewardPaid', (user, reward) => {
    console.log('RewardPaid', user, reward.toString());
  });
}
