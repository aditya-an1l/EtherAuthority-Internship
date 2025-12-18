# 🌐 EtherAuthority Internship: Week 1

### _Mastering the Foundations: Web3, React, and AI_

> **Reporting Period:** `15 Dec – 19 Dec 2025` > **Program:** Web3 & Blockchain · React.js · Node.js · AI-Tools

---

## 🎓 Learning Modules

### 1. Web3 & Blockchain

- **Fundamentals:** Ethereum basics, Gas, Transactions, and Wallets.
- **Solidity:** Syntax, state variables, visibility, and modifiers.
- **Environments:** Configuration of Hardhat and Ganache/Anvil.

### 2. React.js Basics

- **Core Concepts:** Components, Props, State management (useState).
- **Hooks & Logic:** Handling user input, list rendering, and API fetching.

### 3. AI Fundamentals

- **Theoretical Base:** Core concepts and real-world industrial use cases.
- **Documentation:** Created [AI_CONCEPTS.md](https://www.google.com/search?q=./WEEK-1/AI_CONCEPTS.md).

---

## 🛠 Tasks & Work Output

### 📜 Smart Contracts (Deployed on Sepolia)

| Contract Name              | Description                                    | Status      |
| -------------------------- | ---------------------------------------------- | ----------- |
| `HelloWorld.sol`           | Basic string storage                           | ✅ Deployed |
| `Counter.sol`              | Integer increment/decrement                    | ✅ Deployed |
| `SimpleStorage.sol`        | Global state management                        | ✅ Deployed |
| `OwnablePattern.sol`       | Access control & modifiers                     | ✅ Deployed |
| `EtherTransfer.sol`        | Managing value transfers                       | ✅ Deployed |
| `InternshipTaskStatus.sol` | **Core Project:** Store & update task progress | ✅ Deployed |

### ⚛️ React Applications

- **Counter App:** State management demo.
- **Input Form App:** Handling controlled components.
- **Todo List App:** CRUD operations in local state.
- **API Fetch Example:** Integration with external data.
- **Component Reuse:** Demonstrating modular UI architecture.

---

## 🔗 Deliverables

- **GitHub Repository:** [aditya-an1l/EtherAuthority-Internship](https://github.com/aditya-an1l/EtherAuthority-Internship/tree/main/WEEK-1)
<!-- * **Sepolia Contract Address:** `0xYourContractAddressHere` -->
- **AI Documentation:** [View AI_CONCEPTS.md](https://github.com/aditya-an1l/EtherAuthority-Internship/blob/main/WEEK-1/AI_CONCEPTS.md)

---

## 🧠 Challenges & Key Learnings

### 🚩 Challenges Faced

- **Sepolia Gas:** Sourcing reliable faucets for test ETH.
- **Environment Security:** Managing `.env` variables for private keys to avoid repo exposure.
- **Provider Logic:** Connecting Vite-React to the `ethers.js` provider for the first time.

### 💡 How I Solved Them

- Utilized **Alchemy/Infura** RPCs and community-verified faucets.
- Implemented `dotenv` and added it to `.gitignore`.
- Mapped Solidity `enums` (0, 1, 2) to human-readable strings in the React UI.

### ⭐ Key Takeaway

> "Blockchain isn't just about code; it's about the bridge between immutable logic (Solidity) and interactive interfaces (React). Mastering the provider-signer pattern is the key to Web3 UX."

---

## ⚙️ Local Installation

```bash
# Clone the repo
git clone https://github.com/aditya-an1l/EtherAuthority-Internship.git

# Install Smart Contract dependencies
npm install

# Run Frontend
cd WEEK-1/frontend
npm install
npm run dev

```
