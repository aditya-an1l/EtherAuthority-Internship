# 🌐 EtherAuthority Internship — Week 3 Report

### _DeFi, Security & Full-Stack Integration — Staking DApp (MERN + Hardhat)_

## 👤 Intern

- **Name:** Aditya Anil (`aditya-an1l`)
- **Email:** [aditya.anil.productions@gmail.com](mailto:aditya.anil.productions@gmail.com)
- **Week:** Week 3 — DeFi, Security & Full-Stack Integration

## 🔎 Internship Task Summary (Week 3)

**Tasks (as given):**

- Develop a staking smart contract
- Integrate frontend, backend & blockchain
- Security issue analysis
- ML mini-experiment

**Required Deliverables:**

- Staking DApp (frontend + backend + smart contract)
- Security report

This repository contains a complete implementation and supporting materials that map directly to the tasks above.

## 📁 Where each task is implemented (quick map)

Root Directory is : `WEEK-3`

1. **Staking smart contract**

   - Folder: `contracts/`
   - Files: `contracts/Staking.sol`, `contracts/MockERC20.sol` (for local testing), Hardhat tests: `contracts/test/staking.test.js`, deploy script: `contracts/scripts/deploy.js`
   - Notes: Uses OpenZeppelin `Ownable` + `ReentrancyGuard`. `pendingReward`, `stake`, `withdraw`, `claimRewards`, `fundRewards`, `setRewardRate`.

2. **Frontend, backend & blockchain integration (full-stack DApp)**

   - Frontend: `frontend/`

     - React app (Tailwind/CSS based UI), components `ConnectWallet`, `StakeWidget`, pages `Dashboard`.
     - Uses `ethers` for on-chain interaction, reads/writes to staking contract, validates addresses (`ethers.isAddress`).

   - Backend: `backend/`

     - Express + MongoDB + JWT auth (routes: `auth`, `user`), event listener `services/eventListener.js` listens for `Staked`/`Withdrawn`/`RewardPaid` events and can persist them into MongoDB for analytics.

   - Contracts deployed (addresses below).

3. **Chainlink price feeds**

   - Guidance and example integration included in `contracts/` and referenced in docs. Use Chainlink feeds for USD conversion of token value (read-only in contract or fetched off-chain from backend for display).

4. **Security issue analysis (deliverable)**

   - File: `SECURITY_REPORT.md` (root)
   - Contains executive summary, threat model, findings (reentrancy, overflow, access control, reward pool exhaustion), test coverage, and recommendations (timelock, multisig, external audit, rate limiting).

5. **ML mini-experiment**

   - Folder: `ml/` (scripts)
   - Implements synthetic data generation, Logistic Regression training, save/load model, and a Tkinter app that allows CSV upload, feature selection, training, visualization (scatter, confusion matrix, ROC), and single-instance prediction.
   - ML maps to the DApp by predicting **early unstake risk** (helps optimize rewards & UX).

## 🔗 Deployed Contracts

- **Stake Token (STK):** [https://sepolia.etherscan.io/address/0x956BB5Abb63F35d6ED41387803019d4603773040](https://sepolia.etherscan.io/address/0x956BB5Abb63F35d6ED41387803019d4603773040)
- **Reward Token (RWD):** [https://sepolia.etherscan.io/address/0xDe54413C801e1e8B292C6B9180c19bD67Ae23C93](https://sepolia.etherscan.io/address/0xDe54413C801e1e8B292C6B9180c19bD67Ae23C93)
- **Staking Contract:** [https://sepolia.etherscan.io/address/0x7352235A5cB4Eb53C060d5870a1E80fFBe7567CA](https://sepolia.etherscan.io/address/0x7352235A5cB4Eb53C060d5870a1E80fFBe7567CA)

## 📄 Deliverables

- **Staking DApp (full code)**: root folders `contracts/`, `backend/`, `frontend/`
- **Security report**: `SECURITY_REPORT.md`
- **ML project**: `ml/` (training scripts)
- **This README**: `README.md` (root)

---

## ▶️ How to run (development & test)

### 1) Contracts (Hardhat)

```bash
cd WEEK-3
cd contracts
npm install
npx hardhat compile
npx hardhat test           # run unit tests
# Local node:
npx hardhat node
# Deploy to Sepolia (requires .env with SEPOLIA_RPC_URL and DEPLOYER_PRIVATE_KEY)
npx hardhat run --network sepolia scripts/deploy.js
```

**Important env for deployment:** `contracts/.env`

```
SEPOLIA_RPC_URL=https://eth-sepolia.alchemyapi.io/v2/<KEY>
DEPLOYER_PRIVATE_KEY=0x...
```

---

### 2) Backend (Express + MongoDB + JWT)

```bash
cd WEEK-3
cd backend
npm install
cp .env.example .env
# Edit .env: set MONGO_URI, JWT_SECRET, JWT_REFRESH_SECRET, SEPOLIA_RPC_URL, STAKING_CONTRACT_ADDRESS

npm run dev   # starts backend with nodemon
```

**Key env vars:**

```
MONGO_URI=mongodb+srv://<user>:<pass>@.../stakingdb
JWT_SECRET=<random>
JWT_REFRESH_SECRET=<random>
SEPOLIA_RPC_URL=https://eth-sepolia.alchemyapi.io/v2/<KEY>
STAKING_CONTRACT_ADDRESS=0x73..
```

---

### 3) Frontend

```bash
cd WEEK-3
cd frontend
npm install
# set .env in frontend/
# REACT_APP_STAKING_ADDRESS, REACT_APP_STAKING_TOKEN_ADDRESS, REACT_APP_REWARD_TOKEN_ADDRESS
npm start
```

**Frontend .env example:**

```
REACT_APP_STAKING_ADDRESS=0x73...
REACT_APP_STAKING_TOKEN_ADDRESS=0x95...
REACT_APP_REWARD_TOKEN_ADDRESS=0xDe...
REACT_APP_RPC_URL=https://eth-sepolia.alchemyapi.io/v2/<KEY>   # optional
```

**Notes:**

- Restart the dev server after editing `.env`.
- Confirm MetaMask network = Sepolia.

---

### 4) ML

```bash
cd WEEK-3
cd ml
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
python data_generator.py    # generate synthetic dataset
python train_model.py       # creates stake_model.pkl
```

---

### 5) ML Desktop App

```bash
cd WEEK-3
cd ml
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
python main.py
```

- Use the UI to load CSV (column selection), train, visualize, and predict.

## ✅ How the deliverables satisfy the tasks

- **Develop a staking smart contract** → `contracts/Staking.sol` tested with Hardhat. Deployed to Sepolia (address above).
- **Integrate frontend, backend & blockchain** → `frontend/` (React + Ethers.js), `backend/` (Express + JWT + event listener) wired to the deployed contract. Example flows: Approve → Stake; backend indexes events into MongoDB.
- **Security issue analysis** → `SECURITY_REPORT.md` contains threat model, findings & remediation (reentrancy, access control, reward pool exhaustion, JWT best practices, backend rate-limiting).
- **ML mini-experiment** → `ml/` (train/predict scripts and GUI). Demonstrates ML basics, integration strategy, and UX usage (early-unstake risk).

---

---

---

# 🌐 EtherAuthority Internship: Week 2 Report

### _Advanced Web3: Tokens, NFTs & Backend Development_

## 👤 Intern Profile

- **Full Name:** Aditya Anil
- **Email Address:** [aditya.anil.productions@gmail.com](mailto:aditya.anil.productions@gmail.com)
- **Program / Course Name:** Web3 & Blockchain · React.js · Node.js · AI-Tools
- **Reporting Period:** `22 Dec – 27 Dec 2025`
- **Week Number:** Week 2

## 🎓 Learning Topics Covered

This week focused on **token-based incentive systems, NFTs, decentralized storage, and backend integration for Web3 applications**.

### Topics Covered

- **ERC20 & ERC721 Smart Contracts**
- **IPFS & Decentralized Storage**
- **Node.js & Express Backend**
- **MongoDB Database Integration**
- **Token Economics (Tokenomics)**

  - Total Supply
  - Minting & Burning
  - Reward Distribution
  - Vesting Schedules
  - Treasury & Reward Pools
  - Fee Redistribution
  - Anti-Inflation Mechanisms

These concepts were implemented through a **real Internship Reward & Certification DApp**, emphasizing correctness, modularity, and production-style architecture.

## 🛠 Completed Tasks

### 1️⃣ Deploy ERC20 & ERC721 Smart Contracts (Sepolia)

Here is the **updated, consolidated table** with **both links included**:

- 📄 **Source Code link** → GitHub repo (`/smart-contracts/contracts`)
- 🔍 **Deployed Contract link** → Blockscout (Sepolia)

---

| Contract Name                    | Type             | Purpose                                                | Key Features                           | Source Code                                                                                | Deployed Contract                                                                                                |
| -------------------------------- | ---------------- | ------------------------------------------------------ | -------------------------------------- | ------------------------------------------------------------------------------------------ | ---------------------------------------------------------------------------------------------------------------- |
| **AchievementBadgeNFT.sol**      | ERC-721 NFT      | Issues achievement badges for milestones & performance | Soulbound-style logic · IPFS metadata  | [`AchievementBadgeNFT.sol`](./smart-contracts/contracts/AchievementBadgeNFT.sol)           | [Blockscout](https://eth-sepolia.blockscout.com/address/0xc8F61Ff142f65B50EeA06b4c1a378dD2Ace5c7b8?tab=contract) |
| **AttendanceToken.sol**          | ERC-20 Token     | Incentivizes attendance & consistency                  | Supply cap · Anti-inflation logic      | [`AttendanceToken.sol`](./smart-contracts/contracts/AttendanceToken.sol)                   | [Blockscout](https://eth-sepolia.blockscout.com/address/0x0bf01c9dAB1EE4CcDc14068ea9D07EF23829B5C5)              |
| **CourseCompletionNFT.sol**      | ERC-721 NFT      | Verifiable proof of course completion                  | Unique token URIs · IPFS metadata      | [`CourseCompletionNFT.sol`](./smart-contracts/contracts/CourseCompletionNFT.sol)           | [Blockscout](https://eth-sepolia.blockscout.com/address/0x905B77d9F7FD15197F01744bE38e606ADD29fD5e?tab=contract) |
| **InternshipCertificateNFT.sol** | ERC-721 NFT      | Official internship completion certificate             | Transferable · IPFS metadata           | [`InternshipCertificateNFT.sol`](./smart-contracts/contracts/InternshipCertificateNFT.sol) | [Blockscout](https://eth-sepolia.blockscout.com/address/0x85a51949efE425ef6EE0b00fbcA1c5465e1Da5ba?tab=contract) |
| **InternshipRewardToken.sol**    | ERC-20 Token     | Rewards internship milestones & performance            | Fixed supply · Mintable · Burnable     | [`InternshipRewardToken.sol`](./smart-contracts/contracts/InternshipRewardToken.sol)       | [Blockscout](https://eth-sepolia.blockscout.com/address/0x7aB3029BE17069df083200D4C16DeEEd9D9B6551?tab=contract) |
| **TaskCompletionToken.sol**      | ERC-20 Token     | Rewards individual task completion                     | Controlled minting · Progress tracking | [`TaskCompletionToken.sol`](./smart-contracts/contracts/TaskCompletionToken.sol)           | [Blockscout](https://eth-sepolia.blockscout.com/address/0xF5A1edECDDc1F1eF0a37A96944a587c75A85C08f?tab=contract) |
| **NFTMinter.sol**                | Utility Contract | Centralized NFT minting logic                          | Access-controlled · Reusable minting   | [`NFTMinter.sol`](./smart-contracts/contracts/NFTMinter.sol)                               | [Blockscout](https://eth-sepolia.blockscout.com/address/0xC6D5d6e4349b747aEe8D251468290Ee8122Fe64e)              |

#### Notes

- **ERC-20 tokens** track effort, consistency, and performance
- **ERC-721 NFTs** serve as **verifiable credentials**, not grades
- Contracts are designed to **reward learning integrity over shortcuts**
- NFTMinter acts as a **shared minting backbone** for all NFT contracts

### 2️⃣ NFT Minting Contract

A centralized **NFTMinter** smart contract was created to securely mint NFTs across multiple ERC721 contracts.

- Supports admin-controlled minting
- Integrates with Internship & Course NFT contracts

**NFTMinter Contract:**
[https://eth-sepolia.blockscout.com/address/0xC6D5d6e4349b747aEe8D251468290Ee8122Fe64e](https://eth-sepolia.blockscout.com/address/0xC6D5d6e4349b747aEe8D251468290Ee8122Fe64e)

### 3️⃣ Backend Development (Node.js & Express)

A RESTful backend was developed to handle **user registration, task submissions, and token/NFT minting**.

| API Name                    | Endpoint            | Description                           |
| --------------------------- | ------------------- | ------------------------------------- |
| **Intern Registration API** | `POST /register`    | Registers interns with wallet address |
| **Task Submission API**     | `POST /submit-task` | Logs tasks & triggers reward logic    |
| **Token Minting API**       | `POST /mint-token`  | Mints ERC20 rewards or ERC721 NFTs    |

**Tech Stack:** Node.js · Express · Ethers.js · MongoDB · CORS

### 4️⃣ MongoDB Integration

Three MongoDB collections were implemented using **Mongoose schemas**.

| Database              | Purpose                          |
| --------------------- | -------------------------------- |
| **Intern Profile DB** | Stores intern identity & wallet  |
| **Task Tracking DB**  | Tracks task submissions & status |
| **NFT Record DB**     | Stores minted NFT metadata       |

### 5️⃣ React Frontend Integration

A **React-based Web3 frontend** was connected to the backend and blockchain.

### DApps Implemented

- **Internship Reward DApp**
- **NFT Certificate Issuer**
- **Intern Management Web3 Panel**

### Features

- MetaMask wallet integration
- Form-based task submission
- Real-time minting feedback
- Backend API integration

## 📦 Work Output / Deliverables

- **Etherscan / Blockscout Profile:**
  [0xfbb7f5650f2967fe342bd15fcf5ecee39b2705c8](https://sepolia.etherscan.io/address/0xfbb7f5650f2967fe342bd15fcf5ecee39b2705c8)

- **GitHub Repository:**

  - Week 2: [https://github.com/aditya-an1l/EtherAuthority-Internship/tree/main/WEEK-2](https://github.com/aditya-an1l/EtherAuthority-Internship/tree/main/WEEK-2)
  - Full Repo: [https://github.com/aditya-an1l/EtherAuthority-Internship](https://github.com/aditya-an1l/EtherAuthority-Internship)

- **Contract Addresses (Week 2)**

  - **AchievementBadgeNFT:** [https://eth-sepolia.blockscout.com/address/0xc8F61Ff142f65B50EeA06b4c1a378dD2Ace5c7b8?tab=contract](https://eth-sepolia.blockscout.com/address/0xc8F61Ff142f65B50EeA06b4c1a378dD2Ace5c7b8?tab=contract)
  - **AttendanceToken:** [https://eth-sepolia.blockscout.com/address/0x0bf01c9dAB1EE4CcDc14068ea9D07EF23829B5C5](https://eth-sepolia.blockscout.com/address/0x0bf01c9dAB1EE4CcDc14068ea9D07EF23829B5C5)
  - **CourseCompletionNFT:** [https://eth-sepolia.blockscout.com/address/0x905B77d9F7FD15197F01744bE38e606ADD29fD5e?tab=contract](https://eth-sepolia.blockscout.com/address/0x905B77d9F7FD15197F01744bE38e606ADD29fD5e?tab=contract)
  - **InternshipCertificateNFT:** [https://eth-sepolia.blockscout.com/address/0x85a51949efE425ef6EE0b00fbcA1c5465e1Da5ba?tab=contract](https://eth-sepolia.blockscout.com/address/0x85a51949efE425ef6EE0b00fbcA1c5465e1Da5ba?tab=contract)
  - **InternshipRewardToken:** [https://eth-sepolia.blockscout.com/address/0x7aB3029BE17069df083200D4C16DeEEd9D9B6551?tab=contract](https://eth-sepolia.blockscout.com/address/0x7aB3029BE17069df083200D4C16DeEEd9D9B6551?tab=contract)
  - **NFTMinter:** [https://eth-sepolia.blockscout.com/address/0xC6D5d6e4349b747aEe8D251468290Ee8122Fe64e](https://eth-sepolia.blockscout.com/address/0xC6D5d6e4349b747aEe8D251468290Ee8122Fe64e)
  - **TaskCompletionToken:** [https://eth-sepolia.blockscout.com/address/0xF5A1edECDDc1F1eF0a37A96944a587c75A85C08f?tab=contract](https://eth-sepolia.blockscout.com/address/0xF5A1edECDDc1F1eF0a37A96944a587c75A85C08f?tab=contract)

## 🧠 Challenges & Learnings

### Challenges

- Smart contract role & permission management
- ABI compatibility between backend & contracts
- IPFS reliability on free tiers
- Web3 async handling in React

### Learnings

- Tokenomics directly affect system sustainability
- Full-stack Web3 requires strict contract–API alignment
- IPFS enables scalable NFT metadata
- Secure key management is non-negotiable

## ⚙️ How to Run Locally

```bash
git clone https://github.com/aditya-an1l/EtherAuthority-Internship.git
cd EtherAuthority-Internship/WEEK-2
```

### Backend

```bash
cd backend
npm install
npm start
```

### Frontend

```bash
cd frontend
npm install
npm start
```

**Prerequisites:**
Node.js (v16+) · MetaMask · MongoDB Atlas · Sepolia ETH · Infura/Alchemy

## ✅ Week 2 Status

✔ ERC20 Tokens Deployed
✔ ERC721 NFTs Deployed
✔ NFT Minter Implemented
✔ Backend APIs Completed
✔ MongoDB Integrated
✔ React Frontend Connected

---

---

---

# 🌐 EtherAuthority Internship: Week 1 Report

### _Foundations: Web3 + React Basics + AI Basics_

---

## 👤 Intern Profile

- **Full Name:** Aditya Anil
- **Email Address:** <aditya.anil.productions@gmail.com>
- **Program / Course Name:** Web3 & Blockchain · React.js · Node.js · AI-Tools
- **Reporting Period:** `15 Dec – 19 Dec 2025`
- **Week Number:** Week 1

---

## 🎓 Learning Topics Covered

- **Blockchain & Ethereum:** Fundamentals, gas mechanics, nodes, and EVM architecture.
- **Smart Contracts:** Solidity syntax, compilation, and deployment patterns.
- **React.js:** Component architecture, props, state management, and hooks.
- **AI Fundamentals:** Core concepts, machine learning basics, and industrial use cases.
- **Dev Tools:** Configuration of Hardhat, Foundry, and local nodes (Ganache/Anvil).

---

## 🛠 Completed Tasks

### 1. Development Environment Setup

Successfully configured a multi-wallet and multi-IDE environment:

- **IDE:** VS Code , NeoVim & Remix Online IDE.
- **Wallets Configured:** MetaMask, Trust Wallet, Coinmask, TokenPocket, OKX Wallet, and Coinbase Wallet.
- **Frameworks:** Node.js, npm/yarn, and Hardhat.

### 2. Smart Contract Deployment (Sepolia Testnet)

Verified and deployed a suite of 9 contracts on the Sepolia network:

| Contract Name         | Feature            | Blockscout (Interact)                                                                                                            | Sourcify (Code)                                                                            |
| --------------------- | ------------------ | -------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------ |
| **internshipTasks**   | Core Task Tracking | [🔗 Link](https://eth-sepolia.blockscout.com/address/0x3De49B16C572DF4f9e62106987720f3B8dc9B9eB)                                 | [📂 Source](https://repo.sourcify.dev/11155111/0x3De49B16C572DF4f9e62106987720f3B8dc9B9eB) |
| **Hello World**       | String persistence | [🔗 Link](https://www.google.com/search?q=https://eth-sepolia.blockscout.com/address/0xeF9Fc30A7C0413fc3D181Cb922b43d23b274ed47) | [📂 Source](https://repo.sourcify.dev/11155111/0xeF9Fc30A7C0413fc3D181Cb922b43d23b274ed47) |
| **Counter**           | State management   | [🔗 Link](https://www.google.com/search?q=https://eth-sepolia.blockscout.com/address/0x295ED9F28c01787fce3f4B414a2B7a4a5227a0b3) | [📂 Source](https://repo.sourcify.dev/11155111/0x295ED9F28c01787fce3f4B414a2B7a4a5227a0b3) |
| **Simple Storage**    | Global variables   | [🔗 Link](https://eth-sepolia.blockscout.com/address/0x31F223a501225DC1245Cc3316C137f4BCd7DF392)                                 | [📂 Source](https://repo.sourcify.dev/11155111/0x31F223a501225DC1245Cc3316C137f4BCd7DF392) |
| **Ownable Example**   | Access control     | [🔗 Link](https://www.google.com/search?q=https://eth-sepolia.blockscout.com/address/0x8bfeb7Ec45C0816b3d3966BECF5292fEdb51d8FD) | [📂 Source](https://repo.sourcify.dev/11155111/0x8bfeb7Ec45C0816b3d3966BECF5292fEdb51d8FD) |
| **EthersVault**       | Value transfer     | [🔗 Link](https://www.google.com/search?q=https://eth-sepolia.blockscout.com/address/0xd0b9Ff0ebC2fb0d681A5355DADcF6a8295CeE584) | [📂 Source](https://repo.sourcify.dev/11155111/0xd0b9Ff0ebC2fb0d681A5355DADcF6a8295CeE584) |
| **Account Ownership** | Identity Logic     | [🔗 Link](https://eth-sepolia.blockscout.com/address/0x0887f7afB612B15d59BB9499252fd3fd160F0cFA)                                 | [📂 Source](https://repo.sourcify.dev/11155111/0x0887f7afB612B15d59BB9499252fd3fd160F0cFA) |
| **Student Registry**  | Mappings/Structs   | [🔗 Link](https://www.google.com/search?q=https://eth-sepolia.blockscout.com/address/0xbd43D4D53a544cCcc42e1C2aF43Ad4462aA2A3a8) | [📂 Source](https://repo.sourcify.dev/11155111/0xbd43D4D53a544cCcc42e1C2aF43Ad4462aA2A3a8) |
| **Simple Voting**     | Governance         | [🔗 Link](https://eth-sepolia.blockscout.com/address/0x7b94143e86f7CB652D1B3927c8ca4f92781Ea435)                                 | [📂 Source](https://repo.sourcify.dev/11155111/0x7b94143e86f7CB652D1B3927c8ca4f92781Ea435) |

### 3. Basic React Application

The `/frontend` directory contains the following core components, showcasing modular development and Web3 integration:

- **`Card.jsx`**: A reusable UI wrapper component for consistent styling across the app.
- **`Counter.jsx`**: Implementation of basic state management using the `useState` hook.
- **`FetchExample.jsx`**: Demonstrates asynchronous data fetching from external APIs using `useEffect`.

- **`InputForm.jsx`**: Handles user input through controlled components and form validation.

- **`TaskManager.jsx`**: The primary Web3 interface—connects the UI to the `internshipTasks` smart contract via `ethers.js`.

- **`TodoList.jsx`**: A complex state example featuring full CRUD (Create, Read, Update, Delete) logic.

---

## 📦 Work Output / Deliverables

- **Main Etherscan Profile:** [`0xfbb7f5650f2967fe342bd15fcf5ecee39b2705c8`](https://sepolia.etherscan.io/address/0xfbb7f5650f2967fe342bd15fcf5ecee39b2705c8)
- **GitHub Repository:** [WEEK-1 Submissions](https://github.com/aditya-an1l/EtherAuthority-Internship/tree/main/WEEK-1), [Repository](https://github.com/aditya-an1l/EtherAuthority-Internship)
- **AI Documentation:** [AI_CONCEPTS.md](https://github.com/aditya-an1l/EtherAuthority-Internship/blob/main/WEEK-1/AI_CONCEPTS.md)

---

## 🧠 Challenges & Key Learnings

### 🚩 Challenges Faced

- **Setup Hurdles:** Configuring **MetaMask** to sync correctly with **Remix IDE** and Hardhat was time-consuming.
- **Network & Faucets:** Setting up the **Sepolia Network** and obtaining test ETH via faucets was a significant bottleneck due to low availability and strict daily limits.
- **Frontend Debugging:** Faced several bugs in the React code, particularly with asynchronous state updates and ensuring data persistence between component re-renders.

### 💡 How I Tried to Solve Them

- **Network Issues:** Researched and utilized multiple verified faucet providers (Alchemy, Infura) and adjusted gas limits manually in MetaMask.
- **Debugging:** Used Chrome DevTools and React Developer Tools to trace state changes; implemented `useEffect` cleanups to handle API fetch bugs.
- **Syncing:** Re-configured RPC endpoints and ensured the `.env` file matched the provider's specifications.

### ⭐ Key Learnings

- Mastering the **Provider-Signer** pattern for React-to-Blockchain communication.
- Importance of writing **Verified Contracts** on Blockscout/Sourcify for transparency.
- Secure development practices by never committing private keys to GitHub.

---

## ⚙️ How to run locally

```bash
# Install Smart Contract dependencies
npm install

# Run Frontend
cd WEEK-1/frontend
npm install
npm run dev

```
