const express = require("express");
const router = express.Router();
const orderController = require("../controllers/order.controller");

// Create a new order
router.post("/", orderController.createOrder);

// Get all orders
router.get("/", orderController.getOrders);

// Get orders by status
router.get("/status/:status", orderController.getOrdersByStatus);

// Get a single order by ID
router.get("/:id", orderController.getOrderById);

// Update an order
router.put("/:id", orderController.updateOrder);

// Update order status
router.put("/:id/status", orderController.updateOrderStatus); // New route for updating order status

// Delete an order
router.delete("/:id", orderController.deleteOrder);

module.exports = router;
