import React, { useState } from 'react';
import axios from 'axios';

function RegisterIntern() {
  const [form, setForm] = useState({ name: '', email: '', walletAddress: '' });
  const [message, setMessage] = useState('');

  const handleSubmit = async (e) => {
    e.preventDefault();
    try {
      await axios.post('http://localhost:5000/register', form);
      setMessage('Intern registered successfully!');
      setForm({ name: '', email: '', walletAddress: '' }); // Clear form
    } catch (error) {
      setMessage('Error: ' + error.message);
    }
  };

  return (
    <div>
      <h2>Register a New Intern</h2>
      <form onSubmit={handleSubmit}>
        <input
          type="text"
          placeholder="Name"
          value={form.name}
          onChange={(e) => setForm({ ...form, name: e.target.value })}
          required
        />
        <input
          type="email"
          placeholder="Email"
          value={form.email}
          onChange={(e) => setForm({ ...form, email: e.target.value })}
          required
        />
        <input
          type="text"
          placeholder="Wallet Address (0x...)"
          value={form.walletAddress}
          onChange={(e) => setForm({ ...form, walletAddress: e.target.value })}
          required
        />
        <button type="submit">Register</button>
      </form>
      {message && <p>{message}</p>}
    </div>
  );
}

export default RegisterIntern;
