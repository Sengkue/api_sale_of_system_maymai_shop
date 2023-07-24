const express = require("express");
const router = express.Router();
const saleController = require("../controllers/sale.controller");

// Define routes
router.get("/", saleController.getAllSales);
router.get("/sell_online/:id", saleController.getSaleOnlineById);
router.get('/sales/status-type-date', saleController.getSalesByStatusTypeAndDateRange);
router.get("/:id", saleController.getSaleById);
router.get("/type/:sale_type", saleController.getSalesByType); // New route for selecting sales by sale_type
router.get('/:sale_type/:sale_status', saleController.getSalesByStatusAndType); // New route for selecting sales by status and type
router.get('/:sale_type/:sale_status/:customer_id', saleController.getSaleByStatusTypeCustomerId); // New route for selecting sales by status, type, and customer_id
router.post("/", saleController.createSale);
router.put("/:id", saleController.updateSale);
router.put("/:id/status", saleController.updateSaleStatus); // New route for updating sale_status
router.delete("/:id", saleController.deleteSale);

module.exports = router;
