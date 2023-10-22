const mongoose = require('mongoose');

const productSchema = new mongoose.Schema({
  name: {
    type: String,
    required: true,
  },
  price: {
    type: Number,
    required: true,
  },
  categories: [
    {
      type: mongoose.Schema.Types.ObjectId,
      ref: 'Category', // Reference to the 'Category' model for product categories
    },
  ],
  // Other product attributes (e.g., description, stock quantity, etc.)
});

const Product = mongoose.model('Product', productSchema);

module.exports = Product;
