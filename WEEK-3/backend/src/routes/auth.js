import express from 'express';
import bcrypt from 'bcrypt';
import jwt from 'jsonwebtoken';
import User from '../models/User.js';

const router = express.Router();

router.post('/signup', async (req, res) => {
  try {
    const { email, password, wallet } = req.body;
    if (!email || !password) return res.status(400).json({ error: 'missing' });
    const hashed = await bcrypt.hash(password, 12);
    const user = await User.create({ email, password: hashed, wallet });
    return res.json({ ok: true, id: user._id });
  } catch (e) { return res.status(500).json({ error: e.message }); }
});

router.post('/login', async (req, res) => {
  try {
    const { email, password } = req.body;
    const user = await User.findOne({ email });
    if (!user) return res.status(401).json({ error: 'invalid' });
    const match = await bcrypt.compare(password, user.password);
    if (!match) return res.status(401).json({ error: 'invalid' });
    const accessToken = jwt.sign({ uid: user._id }, process.env.JWT_SECRET, { expiresIn: '15m' });
    const refreshToken = jwt.sign({ uid: user._id }, process.env.JWT_REFRESH_SECRET, { expiresIn: '7d' });
    res.cookie('refreshToken', refreshToken, { httpOnly: true, sameSite: 'strict', secure: false });
    return res.json({ accessToken });
  } catch (e) { return res.status(500).json({ error: e.message }); }
});

export default router;
