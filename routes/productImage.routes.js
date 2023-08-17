const express = require('express');
const router = express.Router();
const imageController = require('../controllers/image.controller');

// Create a new image
router.post('/', imageController.create);

// Get all images
router.get('/', imageController.findAll);

// Get a single image by ID
router.get('/:id', imageController.findOne);

// Get images by product ID
router.get('/product/:productId', imageController.findByProductId);

// Update an image by ID
router.put('/:id', imageController.update);

// Delete an image by ID
router.delete('/:id', imageController.delete);

module.exports = router;
