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
