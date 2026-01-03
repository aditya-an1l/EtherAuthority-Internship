import StakingABI from './stakingAbi.json';
import { ethers } from 'ethers';

export function getStakingContract(address, signerOrProvider) {
  return new ethers.Contract(address, StakingABI, signerOrProvider);
}
