# Internship Project — Week 1

**Course / Program:** Web3 & Blockchain · React.js · Node.js · AI-Tools  
**Repository:** <https://github.com/aditya-an1l/EtherAuthority-Internship>

---

## Quick links

- **Contract code (contracts folder)**: <https://github.com/aditya-an1l/EtherAuthority-Internship/tree/main/contracts>
- **React frontend (frontend folder)**: <https://github.com/aditya-an1l/EtherAuthority-Internship/tree/main/frontend>
- **AI concept documentation**: <https://github.com/aditya-an1l/EtherAuthority-Internship/blob/main/AI_CONCEPTS.md>

---

## Project Summary

This repository contains the Week 1 deliverables for the internship covering:

- Blockchain fundamentals & Ethereum basics
- Solidity smart contract examples and deployment scripts (Hardhat)
- React.js demo apps (Counter, Input Form, Todo, API Fetch)
- A Web3 service (`src/services/contract.js`) and `TaskManager` UI component that interacts with the `InternshipTaskStatus` contract
- `AI_CONCEPTS.md` — concise documentation of AI fundamentals and use-cases

---

## Weekly Report

**Program / Course Name:**

- Web3 & Blockchain
- React.js
- Node.js
- AI-Tools

**Week Number:** Week 1

**Reporting Period:** `15 Dec – 19 Dec 2025`

**Learning Topics Covered:**

- Blockchain fundamentals & Ethereum basics
- Solidity syntax and smart contract deployment (Hardhat & Remix)
- React.js fundamentals (components, props, state)
- AI fundamentals and real-world use cases
- Set up Hardhat, Foundry (optional), Ganache/Anvil

**Tasks I Completed This Week?**

- Project scaffold and Hardhat project created
- Wrote example Solidity contracts:
  - `HelloWorld.sol`, `Counter.sol`, `SimpleStorage.sol`, `OwnablePattern.sol`, `EtherTransfer.sol`, `AccountOwnership.sol`, `StudentRegistration.sol`, `SimpleVoting.sol`, `InternshipTaskStatus.sol`
- Created `scripts/deployAll.js` for Hardhat deployment
- Built React frontend (Vite) with components:
  - `Counter`, `InputForm`, enhanced `TodoList`, `FetchExample`, `Card`, `TaskManager`
- Implemented `src/services/contract.js` to connect React <-> Ethereum (MetaMask + ethers v6)
- Wrote `AI_CONCEPTS.md` documentation

**Work Output / Deliverables:**

- Solidity contract source files — `contracts/` folder
- Hardhat scripts (`scripts/`) and `hardhat.config.js`
- React frontend — `frontend/` folder (Vite + React components)
- `AI_CONCEPTS.md` file

**GitHub Repository Link:** <https://github.com/aditya-an1l/EtherAuthority-Internship>

<!-- **Deployed URL / Demo Link (if applicable):**   -->
<!-- - Sepolia contract addresses (paste after deploy):   -->
<!--   - `InternshipTaskStatus: 0x...`   -->
<!--   - `HelloWorld: 0x...`   -->
<!--   - (Add other addresses here) -->
<!-- - Etherscan links example: `https://sepolia.etherscan.io/address/0xYourContractAddress` -->

**Self-Rating for This Week:** 4 / 5 (adjust as you prefer)

**Time Spent on Tasks (Approx.):** 10–15 hours

**Challenges / Issues Faced:**

- Setting up Alchemy/Infura & adding keys to `.env` (private key handling)
- Getting Sepolia test ETH (finding active faucets)
- MetaMask network configuration / switching to Sepolia
- Mapping enum status between Solidity (uint8) and React UI

**How Did I Tried to Solve Them?**

- Used `.env` (never commit) and Hardhat network config for deployments
- Followed Remix for simple one-off deployments to understand the flow
- Checked MetaMask docs and used Chainlist/Alchemy docs for RPC endpoints
- Implemented `Status` enum mapping in `contract.js` / UI (0 = NotStarted, 1 = InProgress, 2 = Done)

**Key Learnings This Week:**

- How Hardhat compiles, deploys, and how to wire deploy scripts to an RPC provider (Alchemy)
- The basics of writing Solidity contracts and using OpenZeppelin for common patterns (Ownable)
- React component composition and state handling for CRUD features (Todo app)
- Connecting React to Ethereum using MetaMask + `ethers` (signer, provider, contract instance)
- Importance of secure key management and not committing secrets

---

## How to run locally (development)

### Prerequisites

- Node.js (LTS) + npm or yarn
- MetaMask installed in your browser (for frontend interaction)
- An Alchemy or Infura API key if you want to deploy to Sepolia
- Sepolia test ETH (from a faucet) if deploying to Sepolia

### 1) Install dependencies

```sh
# project root
npm install

# frontend
cd frontend
npm install
```
