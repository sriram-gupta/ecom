const mongoose = require('mongoose');

const userSchema = new mongoose.Schema({
  username: {
    type: String,
  },
  email: {
    type: String,
  },
  phone_number: {
    type: String,
    required: true,
    unique: true,
  }
}, {
  timestamps: true // Automatically manage createdAt and updatedAt fields
});

const User = mongoose.model('user', userSchema);

module.exports = User;
