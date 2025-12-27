const mongoose = require('mongoose');

const internSchema = new mongoose.Schema({
  name: { type: String, required: true },
  email: { type: String, required: true, unique: true },
  walletAddress: { type: String, required: true },
  tasksCompleted: { type: Number, default: 0 },
  attendance: { type: Number, default: 0 },
});

module.exports = mongoose.model('Intern', internSchema);
