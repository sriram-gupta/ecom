const { Router } = require('express');
const router = Router();
const Order = require('./models/order_schema'); // Import the Order model
const { logger } = require('../../common/logger');

router.post('/', async (req, res, next) => {
  try {
    const { _id: userId, roles } = req.user;
    let { order_items, paymentMethod } = req.body; // Assuming you receive the payment method in the request body

    // Calculate the totalAmount based on order_items (assuming it's an array)
    const totalAmount = order_items.reduce((total, item) => total + item.price * (item.quantity|| 1), 0);

    logger.info(order_items)
    logger.info(totalAmount)

    order_items = order_items.map(e => ({"product":JSON.stringify(e)}))

    // Create a new Order instance
    const newOrder = new Order({
      user: userId, // Assuming userId is the user who placed the order
      orderItems: order_items, // Store order_items as an array of product information
      totalAmount: totalAmount,
      paymentMethod: paymentMethod, // Assign the selected payment method
    });

    // Save the order to the database
    await newOrder.save();

    res.json({ message: 'Order saved successfully' });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Internal Server Error' });
  }
});


router.get('/', async (req, res, next) => {
    try {
      const { _id: userId, roles } = req.user;
      const orders = await Order.find({ user: userId });
      res.json(orders);
    } catch (error) {
      console.error(error);
      res.status(500).json({ error: 'Internal Server Error' });
    }
  });

module.exports = router;
