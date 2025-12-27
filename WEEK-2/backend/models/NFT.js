const mongoose = require('mongoose');

const nftSchema = new mongoose.Schema({
  tokenId: { type: Number, required: true },
  contractAddress: { type: String, required: true },
  internId: { type: mongoose.Schema.Types.ObjectId, ref: 'Intern', required: true },
  mintedAt: { type: Date, default: Date.now },
});

module.exports = mongoose.model('NFT', nftSchema);
