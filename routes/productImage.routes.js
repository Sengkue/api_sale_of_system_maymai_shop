const express = require('express');
const router = express.Router();
const imageController = require('../controllers/image.controller');
const verifyToken = require('../middleware');

// Create a new image
router.post('/',  imageController.create);

// Get all images
router.get('/', verifyToken, imageController.findAll);

// Get a single image by ID
router.get('/:id', imageController.findOne);

// Update an image by ID
router.put('/:id', verifyToken, imageController.update);

// Delete an image by ID
router.delete('/:id', verifyToken, imageController.delete);

module.exports = router;
