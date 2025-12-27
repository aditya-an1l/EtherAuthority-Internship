const mongoose = require('mongoose');

const taskSchema = new mongoose.Schema({
  taskId: { type: String, required: true },
  internId: { type: mongoose.Schema.Types.ObjectId, ref: 'Intern', required: true },
  status: { type: String, enum: ['pending', 'completed'], default: 'pending' },
  submittedAt: { type: Date, default: Date.now },
});

module.exports = mongoose.model('Task', taskSchema);
