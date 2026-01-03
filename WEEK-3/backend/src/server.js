import dotenv from 'dotenv';
dotenv.config();
import mongoose from 'mongoose';
import app from './app.js';
import startEventListener from './services/eventListener.js';

const PORT = process.env.PORT || 4000;

mongoose.connect(process.env.MONGO_URI)
  .then(() => {
    console.log('Mongo connected');
    app.listen(PORT, () => {
      console.log('Server running on', PORT);
    });
    startEventListener();
  })
  .catch(err => { console.error(err); process.exit(1); });
