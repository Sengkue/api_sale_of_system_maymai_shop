const express = require("express");
const router = express.Router();
const importDetailController = require("../controllers/Import_detail.controller");

// Create a new Import Detail
router.post("/", importDetailController.createImportDetail);

// Get all Import Details
router.get("/", importDetailController.getImportDetail);

// Get Import Details by Import ID
router.get("/import/:import_id", importDetailController.getImportDetailsByImportId);

// Get a single Import Detail by ID
router.get("/:id", importDetailController.getImportDetailById);

// Update an Import Detail
router.put("/:id", importDetailController.updateImportDetail);

// Delete an Import Detail
router.delete("/:id", importDetailController.deleteImportDetail);

module.exports = router;
