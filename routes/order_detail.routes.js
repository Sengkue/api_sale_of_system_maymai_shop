const express = require("express");
const router = express.Router();
const orderDetailController = require("../controllers/order_detail.controller");

// Routes
router.get("/", orderDetailController.getOrderDetails);
router.get("/order/:order_id", orderDetailController.getOrderDetailsByOrderId);
router.get("/:id", orderDetailController.getOrderDetailById);
router.post("/", orderDetailController.createOrderDetail);
router.put("/:id", orderDetailController.updateOrderDetail);
router.delete("/:id", orderDetailController.deleteOrderDetail);

module.exports = router;
