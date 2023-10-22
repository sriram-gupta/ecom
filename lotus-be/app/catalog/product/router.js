const {Router } = require('express')
const router = Router()
const Product = require('./models/product_schema')


router.post('/products', async (req, res) => {
  const { name, price, categories, description, stockQuantity } = req.body;

  try {
    const product = new Product({
      name,
      price,
      categories,
      description,
      stockQuantity,
    });

    await product.save();

    res.json(product);
  } catch (err) {
    res.status(500).json({ error: 'Error creating product' });
  }
});

// Get all products
router.get('/products', async (req, res) => {
  try {
    const products = await Product.find().populate('categories');
    res.json(products);
  } catch (err) {
    res.status(500).json({ error: 'Error getting products' });
  }
});

// Get a specific product by ID
router.get('/products/:productId', async (req, res) => {
  const productId = req.params.productId;

  try {
    const product = await Product.findById(productId).populate('categories');
    if (!product) {
      res.status(404).json({ error: 'Product not found' });
    } else {
      res.json(product);
    }
  } catch (err) {
    res.status(500).json({ error: 'Error getting product' });
  }
});

// Update a product by ID
router.put('/products/:productId', async (req, res) => {
  const productId = req.params.productId;
  const { name, price, categories, description, stockQuantity } = req.body;

  try {
    const product = await Product.findByIdAndUpdate(
      productId,
      { name, price, categories, description, stockQuantity },
      { new: true }
    );

    if (!product) {
      res.status(404).json({ error: 'Product not found' });
    } else {
      res.json(product);
    }
  } catch (err) {
    res.status(500).json({ error: 'Error updating product' });
  }
});

// Delete a product by ID
router.delete('/products/:productId', async (req, res) => {
  const productId = req.params.productId;

  try {
    const product = await Product.findById(productId);

    if (!product) {
      res.status(404).json({ error: 'Product not found' });
    } else {
      await product.remove();
      res.json({ message: 'Product deleted successfully' });
    }
  } catch (err) {
    res.status(500).json({ error: 'Error deleting product' });
  }
});

module.exports = router;