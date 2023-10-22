const express = require('express');
const router = express.Router();
const Category = require('./models/category_scehma'); // Import your Category and Product models
const Product = require('../product/models/product_schema')

// Get all categories
router.get('/categories', async (req, res) => {
  try {
    const categories = await Category.find().populate('children');
    res.json(categories);
  } catch (err) {
    res.status(500).json({ error: 'Error getting categories' });
  }
});

// Create a new category
router.post('/categories', async (req, res) => {
  const { name, parentId } = req.body;

  try {
    const parentCategory = parentId ? await Category.findById(parentId) : null;

    const category = new Category({
      name,
      parent: parentCategory,
    });

    await category.save();

    if (parentCategory) {
      parentCategory.children.push(category);
      await parentCategory.save();
    }

    res.json(category);
  } catch (err) {
    res.status(500).json({ error: 'Error creating category' });
  }
});

// Get a specific category by ID
router.get('/categories/:categoryId', async (req, res) => {
  const categoryId = req.params.categoryId;

  try {
    const category = await Category.findById(categoryId).populate('children');
    if (!category) {
      res.status(404).json({ error: 'Category not found' });
    } else {
      res.json(category);
    }
  } catch (err) {
    res.status(500).json({ error: 'Error getting category' });
  }
});

// Update a category by ID
router.put('/categories/:categoryId', async (req, res) => {
  const categoryId = req.params.categoryId;
  const { name } = req.body;

  try {
    const category = await Category.findByIdAndUpdate(
      categoryId,
      { name },
      { new: true }
    );

    if (!category) {
      res.status(404).json({ error: 'Category not found' });
    } else {
      res.json(category);
    }
  } catch (err) {
    res.status(500).json({ error: 'Error updating category' });
  }
});

// Delete a category by ID
router.delete('/categories/:categoryId', async (req, res) => {
  const categoryId = req.params.categoryId;

  try {
    const category = await Category.findById(categoryId);

    if (!category) {
      res.status(404).json({ error: 'Category not found' });
    } else {
      // Remove the category from its parent's children list, if applicable
      if (category.parent) {
        const parentCategory = await Category.findById(category.parent);
        parentCategory.children = parentCategory.children.filter(
          (childId) => childId.toString() !== categoryId
        );
        await parentCategory.save();
      }

      // Delete the category
      await category.remove();
      res.json({ message: 'Category deleted successfully' });
    }
  } catch (err) {
    res.status(500).json({ error: 'Error deleting category' });
  }
});

// The following routes for products (create, read, update, delete) can be implemented similarly to the category routes.

module.exports = router;
