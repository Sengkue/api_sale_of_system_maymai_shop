const express = require("express");
const router = express.Router();
const saleController = require("../controllers/sale.controller");

// Define routes
router.get("/", saleController.getAllSales);
router.get("/:id", saleController.getSaleById);
router.get("/type/:sale_type", saleController.getSalesByType); // New route for selecting sales by sale_type
router.get('/:sale_type/:sale_status', saleController.getSalesByStatusAndType); // New route for selecting sales by status and type
router.post("/", saleController.createSale);
router.put("/:id", saleController.updateSale);
router.delete("/:id", saleController.deleteSale);

module.exports = router;
