const ColorSize = require("../models/color_size.model");

exports.create = (req, res) => {
  const { product_id, color, size, quantity, cost_price, sale_price } = req.body;

  // Convert quantity, cost_price, and sale_price to numbers (if provided).
  const parsedQuantity = Number(quantity) || 0;
  const parsedCostPrice = cost_price ? parseFloat(cost_price) : null;
  const parsedSalePrice = sale_price ? parseFloat(sale_price) : null;

  // Check if the combination of product_id, color, and size already exists in the database.
  ColorSize.findOne({ where: { product_id, color, size } })
    .then((existingColorSize) => {
      if (existingColorSize) {
        // If the combination exists, update the existing record.
        existingColorSize
          .update({
            quantity: existingColorSize.quantity + parsedQuantity, // Add the new quantity to the existing one.
            cost_price: parsedCostPrice !== null ? parsedCostPrice : existingColorSize.cost_price, // Update cost_price if provided, otherwise keep the existing value.
            sale_price: parsedSalePrice !== null ? parsedSalePrice : existingColorSize.sale_price, // Update sale_price if provided, otherwise keep the existing value.
          })
          .then((updatedColorSize) => {
            return res.status(200).json({ result: updatedColorSize });
          })
          .catch((error) => {
            return res.status(500).json({ result: error });
          });
      } else {
        // If the combination doesn't exist, create a new record.
        ColorSize.create({
          product_id,
          color,
          size,
          quantity: parsedQuantity,
          cost_price: parsedCostPrice,
          sale_price: parsedSalePrice,
        })
          .then((newColorSize) => {
            return res.status(201).json({ result: newColorSize });
          })
          .catch((error) => {
            return res.status(500).json({ result: error });
          });
      }
    })
    .catch((error) => {
      return res.status(500).json({ result: error });
    });
};

exports.update = (req, res) => {
  const id = req.params.id;
  const colorSize = {
    product_id: req.body.product_id,
    color: req.body.color,
    size: req.body.size,
    quantity: req.body.quantity || 0,
    cost_price: req.body.cost_price || null, // Default value is null if not provided.
    sale_price: req.body.sale_price || null, // Default value is null if not provided.
  };

  ColorSize.update(colorSize, { where: { id: id } })
    .then((data) => {
      return res.status(200).json({ result: data });
    })
    .catch((error) => {
      return res.status(500).json({ result: error });
    });
};

exports.delete = (req, res) => {
  const id = req.params.id;

  ColorSize.destroy({ where: { id: id } })
    .then((data) => {
      return res.status(200).json({ result: data });
    })
    .catch((error) => {
      return res.status(500).json({ result: error });
    });
};

exports.selectAll = (req, res) => {
  ColorSize.findAll()
    .then((data) => {
      return res.status(200).json({ result: data });
    })
    .catch((error) => {
      return res.status(500).json({ result: error });
    });
};

exports.findOne = (req, res) => {
  const id = req.params.id;

  ColorSize.findOne({ where: { id: id } })
    .then((data) => {
      if (!data) {
        return res.status(404).json({ result: "ColorSize not found" });
      }
      return res.status(200).json({ result: data });
    })
    .catch((error) => {
      return res.status(500).json({ result: error });
    });
};

exports.findByProductId = (req, res) => {
  const product_id = req.params.product_id;

  ColorSize.findAll({ where: { product_id: product_id } })
    .then((data) => {
      if (data.length === 0) {
        return res.status(404).json({ result: "No ColorSize entries found for the specified product_id" });
      }
      return res.status(200).json({ result: data });
    })
    .catch((error) => {
      return res.status(500).json({ result: error });
    });
};

exports.subtractQuantity = (req, res) => {
  const id = req.params.id;
  const quantityToSubtract = req.body.quantity;

  ColorSize.findOne({ where: { id: id } })
    .then((colorSize) => {
      if (!colorSize) {
        return res.status(404).json({ result: "ColorSize not found" });
      }

      let updatedQuantity = colorSize.quantity - quantityToSubtract;
      if (updatedQuantity <= 0) {
        // If updatedQuantity is less than or equal to 0, delete the entry.
        return colorSize
          .destroy()
          .then(() => {
            return res.status(200).json({ result: "ColorSize deleted successfully" });
          })
          .catch((error) => {
            return res.status(500).json({ result: error });
          });
      } else {
        // If updatedQuantity is greater than 0, update the quantity field.
        return colorSize
          .update({ quantity: updatedQuantity })
          .then((data) => {
            return res.status(200).json({ result: data });
          })
          .catch((error) => {
            return res.status(500).json({ result: error });
          });
      }
    })
    .catch((error) => {
      return res.status(500).json({ result: error });
    });
};

exports.subtractQuantityByColorSizeAndProductId = (req, res) => {
  const id = req.params.id;
  const product_id = req.params.product_id;
  const quantityToSubtract = req.body.quantity;

  ColorSize.findOne({ where: { id: id, product_id: product_id } })
    .then((colorSize) => {
      if (!colorSize) {
        return res.status(404).json({ result: "ColorSize not found for the specified ID and product_id" });
      }

      let updatedQuantity = colorSize.quantity - quantityToSubtract;
      if (updatedQuantity <= 0) {
        // If updatedQuantity is less than or equal to 0, delete the entry.
        return colorSize
          .destroy()
          .then(() => {
            return res.status(200).json({ result: "ColorSize deleted successfully" });
          })
          .catch((error) => {
            return res.status(500).json({ result: error });
          });
      } else {
        // If updatedQuantity is greater than 0, update the quantity field.
        return colorSize
          .update({ quantity: updatedQuantity })
          .then((data) => {
            return res.status(200).json({ result: data });
          })
          .catch((error) => {
            return res.status(500).json({ result: error });
          });
      }
    })
    .catch((error) => {
      return res.status(500).json({ result: error });
    });
};
