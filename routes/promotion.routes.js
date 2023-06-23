const express = require('express');
const router = express.Router();
const promotionController = require('../controllers/promotion.controller');

// Get all promotions
router.get('/', promotionController.getAllPromotions);

// Get a single promotion by ID
router.get('/:id', promotionController.getPromotionById);

// Create a new promotion
router.post('/', promotionController.createPromotion);

// Update a promotion by ID
router.put('/:id', promotionController.updatePromotion);

// Delete a promotion by ID
router.delete('/:id', promotionController.deletePromotion);

module.exports = router;
