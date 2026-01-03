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

   - Folder: `ml/` (scripts) and `ml-staking-tk/` (Tkinter desktop UI)
   - Implements synthetic data generation, Logistic Regression training, save/load model, and a Tkinter app that allows CSV upload, feature selection, training, visualization (scatter, confusion matrix, ROC), and single-instance prediction.
   - ML maps to the DApp by predicting **early unstake risk** (helps optimize rewards & UX).

## 🔗 Deployed Contracts

- **Stake Token (STK):** [https://sepolia.etherscan.io/address/0x956BB5Abb63F35d6ED41387803019d4603773040](https://sepolia.etherscan.io/address/0x956BB5Abb63F35d6ED41387803019d4603773040)
- **Reward Token (RWD):** [https://sepolia.etherscan.io/address/0xDe54413C801e1e8B292C6B9180c19bD67Ae23C93](https://sepolia.etherscan.io/address/0xDe54413C801e1e8B292C6B9180c19bD67Ae23C93)
- **Staking Contract:** [https://sepolia.etherscan.io/address/0x7352235A5cB4Eb53C060d5870a1E80fFBe7567CA](https://sepolia.etherscan.io/address/0x7352235A5cB4Eb53C060d5870a1E80fFBe7567CA)

## 📄 Deliverables

- **Staking DApp (full code)**: root folders `contracts/`, `backend/`, `frontend/`
- **Security report**: `SECURITY_REPORT.md`
- **ML project**: `ml/` (training scripts) and `ml-staking-tk/` (Tkinter UI)
- **This README**: `README.md` (root)

---

## ▶️ How to run (development & test)

### 1) Contracts (Hardhat)

```bash
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
cd ml-staking-tk
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
- **ML mini-experiment** → `ml/` (train/predict scripts) + `ml-staking-tk/` (GUI). Demonstrates ML basics, integration strategy, and UX usage (early-unstake risk).
