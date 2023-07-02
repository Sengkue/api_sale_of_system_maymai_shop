const express = require("express");
const router = express.Router();
const orderController = require("../controllers/order.controller");

// Create a new order
router.post("/orders", orderController.createOrder);

// Get all orders
router.get("/orders", orderController.getOrders);

// Get a single order by ID
router.get("/orders/:id", orderController.getOrderById);

// Update an order
router.put("/orders/:id", orderController.updateOrder);

// Delete an order
router.delete("/orders/:id", orderController.deleteOrder);

module.exports = router;
