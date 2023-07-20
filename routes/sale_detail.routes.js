const express = require("express");
const router = express.Router();
const saleDetailController = require("../controllers/sale_detail.controller");

// Routes
router.get("/", saleDetailController.getAllSaleDetails);
router.get('/hot/product', saleDetailController.getHot);
router.get('/popular/product', saleDetailController.getPopularProduct);
router.get('/sale-details/summary', saleDetailController.getSaleDetailSummary);
router.get('/summary/group', saleDetailController.getSaleDetailSummaryGroup);
router.get('/summary/month', saleDetailController.getSaleDetailSummaryByMonth); // New route for summary by month
router.get('/summary/year', saleDetailController.getSaleDetailSummaryByYear);
router.get("/:id", saleDetailController.getSaleDetailById);
router.post("/", saleDetailController.createSaleDetail);
router.put("/:id", saleDetailController.updateSaleDetail);
router.delete("/:id", saleDetailController.deleteSaleDetail);
router.get('/sale/:sale_id', saleDetailController.getSaleDetailsBySaleId);

module.exports = router;
