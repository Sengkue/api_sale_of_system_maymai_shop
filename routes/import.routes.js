const express = require("express");
const router = express.Router();
const importController = require("../controllers/import.controller");

// Routes
router.get("/", importController.getAllImports);
router.get("/by-date-range", importController.getImportsByDateRange)
router.get("/all-by-date", importController.getAllByDate)
router.get("/:id", importController.getImportById);
router.post("/", importController.createImport);
router.put("/:id", importController.updateImport);
router.delete("/:id", importController.deleteImport);
module.exports = router;
