const express = require('express');
const mongoose = require('mongoose');
const cors = require('cors');
const Web3 = require('web3');
require('dotenv').config();

const Intern = require('./models/Intern');
const Task = require('./models/Task');
const NFT = require('./models/NFT');

const app = express();
app.use(express.json());
app.use(cors());

// Connect to MongoDB
mongoose.connect(process.env.MONGO_URI, { useNewUrlParser: true, useUnifiedTopology: true })
  .then(() => console.log('MongoDB connected'))
  .catch(err => console.log(err));

// Initialize Web3 with Infura
const web3 = new Web3(process.env.INFURA_URL);

// Load contract ABIs and addresses (replace with your deployed addresses)
const irtAbi = require('./contracts/InternRewardToken.json'); // You'll need to export ABIs from Hardhat
const irtAddress = '0xYourIRTAddress'; // From deployment
const minterAbi = require('./contracts/NFTMinter.json');
const minterAddress = '0xYourMinterAddress';

// Intern Registration API
app.post('/register', async (req, res) => {
  try {
    const { name, email, walletAddress } = req.body;
    const intern = new Intern({ name, email, walletAddress });
    await intern.save();
    res.json({ message: 'Intern registered successfully' });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Task Submission API
app.post('/submit-task', async (req, res) => {
  try {
    const { internId, taskId } = req.body;
    const task = new Task({ taskId, internId, status: 'completed' });
    await task.save();
    // Mint ERC20 token (example for TaskCompletionToken)
    const contract = new web3.eth.Contract(irtAbi, irtAddress);
    // Add logic to send transaction (requires private key setup)
    res.json({ message: 'Task submitted and token minted' });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Token Minting API (for ERC20)
app.post('/mint-token', async (req, res) => {
  try {
    const { internId, tokenType } = req.body; // tokenType: 'reward', 'task', 'attendance'
    // Similar to above, interact with respective ERC20 contract
    res.json({ message: 'Token minted' });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// NFT Minting API
app.post('/mint-nft', async (req, res) => {
  try {
    const { internId, nftType, uri } = req.body; // nftType: 'certificate', 'course', 'badge'
    const contract = new web3.eth.Contract(minterAbi, minterAddress);
    // Call mint function (requires transaction setup)
    const nft = new NFT({ tokenId: 1, contractAddress: minterAddress, internId });
    await nft.save();
    res.json({ message: 'NFT minted' });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

app.listen(5000, () => console.log('Server running on port 5000'));
