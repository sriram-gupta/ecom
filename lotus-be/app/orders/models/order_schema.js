const mongoose = require('mongoose');

// Define the Order schema
const orderSchema = new mongoose.Schema({
  user: {
    type: mongoose.Schema.Types.ObjectId, // Reference to the User who placed the order
    ref: 'User', // Replace 'User' with the actual name of your User model
    required: true,
  },
  orderItems: [
    {
      product: {
        type: String, // Store product information as a JSON string
      },
      quantity: {
        type: Number,
        default: 1
      },
    },
  ],
  totalAmount: {
    type: Number,

  },
  paymentMethod: {
    type: String,

  },
  orderDate: {
    type: Date,
    default: Date.now,
  },
});

// Create the Order model
const Order = mongoose.model('Order', orderSchema);

module.exports = Order;
