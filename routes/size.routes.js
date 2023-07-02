const express = require("express");
const router = express.Router();
const sizeController = require("../controllers/size.controller");

// Define routes for sizes
router.post("/", sizeController.create);
router.get("/", sizeController.findAll);
router.get("/:id", sizeController.findOne);
router.put("/:id", sizeController.update);
router.delete("/:id", sizeController.delete);
router.delete("/", sizeController.deleteAll);

module.exports = router;
