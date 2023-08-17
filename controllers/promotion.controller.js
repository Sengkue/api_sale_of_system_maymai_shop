const Promotion = require('../models/promotion.model');

// Get all promotions
exports.getAllPromotions = async (req, res) => {
  try {
    const promotions = await Promotion.findAll();
    res.json(promotions);
  } catch (error) {
    res.status(500).json({ error: 'Internal server error' });
  }
};

// Get a single promotion by ID
exports.getPromotionById = async (req, res) => {
  const { id } = req.params;
  try {
    const promotion = await Promotion.findByPk(id);
    if (!promotion) {
      return res.status(404).json({ error: 'Promotion not found' });
    }
    res.json(promotion);
  } catch (error) {
    res.status(500).json({ error: 'Internal server error' });
  }
};

// Create a new promotion
exports.createPromotion = async (req, res) => {
  const { name, condition, discount } = req.body;
  try {
    const promotion = await Promotion.create({
      name,
      condition,
      discount,
    });
    res.status(201).json(promotion);
  } catch (error) {
    res.status(500).json({ error: 'Internal server error' });
  }
};

// Update a promotion by ID
exports.updatePromotion = async (req, res) => {
  const { id } = req.params;
  const { name, condition, discount } = req.body;
  try {
    const promotion = await Promotion.findByPk(id);
    if (!promotion) {
      return res.status(404).json({ error: 'Promotion not found' });
    }
    promotion.name = name;
    promotion.condition = condition;
    promotion.discount = discount;
    await promotion.save();
    res.json(promotion);
  } catch (error) {
    res.status(500).json({ error: 'Internal server error' });
  }
};

// Delete a promotion by ID
exports.deletePromotion = async (req, res) => {
  const { id } = req.params;
  try {
    const promotion = await Promotion.findByPk(id);
    if (!promotion) {
      return res.status(404).json({ error: 'Promotion not found' });
    }
    await promotion.destroy();
    res.json({ message: 'Promotion deleted successfully' });
  } catch (error) {
    res.status(500).json({ error: 'Internal server error' });
  }
};
