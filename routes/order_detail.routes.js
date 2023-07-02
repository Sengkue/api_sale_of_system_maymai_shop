const express = require("express");
const router = express.Router();
const orderDetailController = require("../controllers/order_detail.controller");

// Create a new order detail
router.post("/", orderDetailController.createOrderDetail);

// Get all order details
router.get("/", orderDetailController.getOrderDetails);

// Get a single order detail by ID
router.get("/:id", orderDetailController.getOrderDetailById);

// Update an order detail
router.put("/:id", orderDetailController.updateOrderDetail);

// Delete an order detail
router.delete("/:id", orderDetailController.deleteOrderDetail);

module.exports = router;
