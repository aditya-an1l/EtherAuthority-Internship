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
