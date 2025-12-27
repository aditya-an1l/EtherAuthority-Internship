import React, { useState } from 'react';
import axios from 'axios';

function SubmitTask() {
  const [form, setForm] = useState({ internId: '', taskId: '' });
  const [message, setMessage] = useState('');

  const handleSubmit = async (e) => {
    e.preventDefault();
    try {
      await axios.post('http://localhost:5000/submit-task', form);
      setMessage('Task submitted successfully!');
      setForm({ internId: '', taskId: '' }); // Clear form
    } catch (error) {
      setMessage('Error: ' + error.message);
    }
  };

  return (
    <div>
      <h2>Submit a Task</h2>
      <form onSubmit={handleSubmit}>
        <input
          type="text"
          placeholder="Intern ID (from MongoDB)"
          value={form.internId}
          onChange={(e) => setForm({ ...form, internId: e.target.value })}
          required
        />
        <input
          type="text"
          placeholder="Task ID"
          value={form.taskId}
          onChange={(e) => setForm({ ...form, taskId: e.target.value })}
          required
        />
        <button type="submit">Submit Task</button>
      </form>
      {message && <p>{message}</p>}
    </div>
  );
}

export default SubmitTask;
