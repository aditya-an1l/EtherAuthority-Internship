import { ethers } from "ethers";

/* ---------------------------------
   1. CONTRACT CONFIG
---------------------------------- */

export const CONTRACT_ADDRESS = "0xYOUR_SEPOLIA_CONTRACT_ADDRESS";

export const CONTRACT_ABI = [
  {
    "inputs": [],
    "stateMutability": "nonpayable",
    "type": "constructor"
  },
  {
    "anonymous": false,
    "inputs": [
      { "indexed": true, "internalType": "uint256", "name": "id", "type": "uint256" },
      { "indexed": false, "internalType": "string", "name": "title", "type": "string" }
    ],
    "name": "TaskCreated",
    "type": "event"
  },
  {
    "inputs": [
      { "internalType": "string", "name": "title", "type": "string" },
      { "internalType": "string", "name": "description", "type": "string" }
    ],
    "name": "createTask",
    "outputs": [],
    "stateMutability": "nonpayable",
    "type": "function"
  },
  {
    "inputs": [
      { "internalType": "uint256", "name": "id", "type": "uint256" },
      { "internalType": "uint8", "name": "newStatus", "type": "uint8" }
    ],
    "name": "updateStatus",
    "outputs": [],
    "stateMutability": "nonpayable",
    "type": "function"
  },
  {
    "inputs": [{ "internalType": "uint256", "name": "id", "type": "uint256" }],
    "name": "getTask",
    "outputs": [
      { "internalType": "string", "name": "", "type": "string" },
      { "internalType": "string", "name": "", "type": "string" },
      { "internalType": "uint8", "name": "", "type": "uint8" },
      { "internalType": "address", "name": "", "type": "address" }
    ],
    "stateMutability": "view",
    "type": "function"
  }
];

/* ---------------------------------
   2. PROVIDER + CONTRACT HELPERS
---------------------------------- */

export async function getProvider() {
  if (!window.ethereum) {
    alert("MetaMask not installed");
    throw new Error("MetaMask missing");
  }
  await window.ethereum.request({ method: "eth_requestAccounts" });
  return new ethers.BrowserProvider(window.ethereum);
}

export async function getContract() {
  const provider = await getProvider();
  const signer = await provider.getSigner();
  return new ethers.Contract(CONTRACT_ADDRESS, CONTRACT_ABI, signer);
}

/* ---------------------------------
   3. CONTRACT METHODS
---------------------------------- */

export async function createTask(title, description) {
  const contract = await getContract();
  const tx = await contract.createTask(title, description);
  await tx.wait();
}

export async function updateTaskStatus(taskId, status) {
  const contract = await getContract();
  const tx = await contract.updateStatus(taskId, status);
  await tx.wait();
}

export async function getTask(taskId) {
  const contract = await getContract();
  return await contract.getTask(taskId);
}
