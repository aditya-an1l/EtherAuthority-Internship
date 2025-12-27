import React, { useState } from 'react';
import axios from 'axios';

function MintNFT() {
  const [form, setForm] = useState({ internId: '', nftType: 'certificate', uri: '' });
  const [message, setMessage] = useState('');

  const handleSubmit = async (e) => {
    e.preventDefault();
    try {
      await axios.post('http://localhost:5000/mint-nft', form);
      setMessage('NFT minted successfully!');
      setForm({ internId: '', nftType: 'certificate', uri: '' }); // Clear form
    } catch (error) {
      setMessage('Error: ' + error.message);
    }
  };

  return (
    <div>
      <h2>Mint an NFT</h2>
      <form onSubmit={handleSubmit}>
        <input
          type="text"
          placeholder="Intern ID (from MongoDB)"
          value={form.internId}
          onChange={(e) => setForm({ ...form, internId: e.target.value })}
          required
        />
        <select
          value={form.nftType}
          onChange={(e) => setForm({ ...form, nftType: e.target.value })}
        >
          <option value="certificate">Internship Certificate</option>
          <option value="course">Course Completion</option>
          <option value="badge">Achievement Badge</option>
        </select>
        <input
          type="text"
          placeholder="Metadata URI (e.g., IPFS link)"
          value={form.uri}
          onChange={(e) => setForm({ ...form, uri: e.target.value })}
          required
        />
        <button type="submit">Mint NFT</button>
      </form>
      {message && <p>{message}</p>}
    </div>
  );
}

export default MintNFT;
