const express = require('express');
const router = express.Router();
const provinceController = require('../controllers/province.controller');

// Create a new province
router.post('/', provinceController.create);

// Get all provinces
router.get('/', provinceController.findAll);

// Get a single province by ID
router.get('/:id', provinceController.findOne);

// Update a province by ID
router.put('/:id', provinceController.update);

// Delete a province by ID
router.delete('/:id', provinceController.delete);

// Delete all provinces
router.delete('/', provinceController.deleteAll);

module.exports = router;
