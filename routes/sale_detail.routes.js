const express = require("express");
const router = express.Router();
const saleDetailController = require("../controllers/sale_detail.controller");

// Routes
router.get("/", saleDetailController.getAllSaleDetails);
router.get("/:id", saleDetailController.getSaleDetailById);
router.post("/", saleDetailController.createSaleDetail);
router.put("/:id", saleDetailController.updateSaleDetail);
router.delete("/:id", saleDetailController.deleteSaleDetail);

module.exports = router;
