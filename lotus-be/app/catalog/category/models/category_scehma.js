const mongoose = require('mongoose');

const categorySchema = new mongoose.Schema({
  name: {
    type: String,
    required: true,
  },
  parent: {
    type: mongoose.Schema.Types.ObjectId,
    ref: 'Category', // Reference to the 'Category' model for parent category
  },
  children: [
    {
      type: mongoose.Schema.Types.ObjectId,
      ref: 'Category', // Reference to the 'Category' model for child categories
    },
  ],
});

const Category = mongoose.model('Category', categorySchema);

module.exports = Category;
