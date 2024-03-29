const Product = require("../models/product.model");
const Category = require("../models/category.model");
const sequelize = require("../config/db");
const { QueryTypes } = require('sequelize');
exports.searchProducts = (req, res) => {
  const keyword = req.query.keyword;
  const maxPrice = parseFloat(req.query.price);
  const categoryId = req.query.category;
  const limit = req.query.limit ? parseInt(req.query.limit) : 10;

  if (!keyword || keyword.trim() === "") {
    return res.status(400).json({ result: "Please provide a valid search keyword" });
  }

  let whereClause = "";
  let replacements = { searchKeyword: `%${keyword}%` };

  if (maxPrice) {
    whereClause += " AND pr.sale_price <= :maxPrice";
    replacements = { ...replacements, maxPrice };
  }

  if (categoryId) {
    whereClause += " AND pr.category_id = :categoryId";
    replacements = { ...replacements, categoryId };
  }

  sequelize
    .query(
      `SELECT pr.profile, pr.id, pr.name, ca.category, pr.size_id, pr.color, pr.description, pr.quantity, pr.sale_price, pr.cost_price, pr.Barcode, pr.createdAt, pr.updatedAt, sup.name AS supplier_name,
      ca.id AS category_id, sup.id AS supplier_id
      FROM products pr
      INNER JOIN categories ca ON pr.category_id = ca.id
      INNER JOIN Suppliers sup ON pr.supplier_id = sup.id
      WHERE (pr.name LIKE :searchKeyword OR pr.description LIKE :searchKeyword) ${whereClause}
      LIMIT :limit`,
      {
        replacements: { ...replacements, limit },
        type: QueryTypes.SELECT,
      }
    )
    .then((data) => {
      if (data.length === 0) {
        return res.status(404).json({ result: "No products found for the specified search criteria" });
      }
      return res.status(200).json({ result: data });
    })
    .catch((error) => {
      return res.status(500).json({ result: error });
    });
};
exports.create = (req, res) => {
  Product.create({ ...req.body })
    .then((data) => {
      return res.status(200).json({ result: data });
    })
    .catch((error) => {
      return res.status(200).json({ result: error });
    });
};
exports.getProductsBySupplierId = (req, res) => {
  const { supplier_id } = req.params;

  sequelize
    .query(
      `SELECT pr.profile, pr.id, pr.name, ca.category, pr.size_id, pr.color, pr.description, pr.quantity, pr.sale_price, pr.cost_price, pr.Barcode, pr.createdAt, pr.updatedAt, sup.name AS supplier_name,
      ca.id AS category_id, sup.id AS supplier_id
      FROM products pr
      INNER JOIN categories ca ON pr.category_id = ca.id
      INNER JOIN Suppliers sup ON pr.supplier_id = sup.id
      WHERE pr.supplier_id = :supplier_id
      ORDER BY pr.quantity ASC`, // Added ORDER BY clause to sort by quantity in ascending order
      {
        replacements: { supplier_id },
        type: QueryTypes.SELECT,
      }
    )
    .then((data) => {
      if (data.length === 0) {
        return res.status(404).json({ result: 'No products found for the specified supplier' });
      }
      return res.status(200).json({ result: data });
    })
    .catch((error) => {
      return res.status(500).json({ result: error });
    });
};


exports.getProductsByCategoryId = (req, res) => {
  const { category_id } = req.params;
  let limit = req.query.limit || 8; // Use 'limit' query parameter if provided, otherwise default to 8
  limit = parseInt(limit, 10); // Convert 'limit' to a number

  sequelize
    .query(
      `SELECT pr.profile, pr.id, pr.name, ca.category, pr.size_id, pr.color, pr.description, pr.quantity, pr.sale_price, pr.cost_price, pr.Barcode, pr.createdAt, pr.updatedAt, sup.name AS supplier_name,
      ca.id AS category_id, sup.id AS supplier_id
      FROM products pr
      INNER JOIN categories ca ON pr.category_id = ca.id
      INNER JOIN Suppliers sup ON pr.supplier_id = sup.id
      WHERE ca.id = :category_id
      LIMIT :limit`, // Add the LIMIT clause here
      {
        replacements: { category_id, limit }, // Include the limit in replacements
        type: QueryTypes.SELECT,
      }
    )
    .then((data) => {
      if (data.length === 0) {
        return res.status(404).json({ result: 'No products found for the category' });
      }
      return res.status(200).json({ result: data });
    })
    .catch((error) => {
      return res.status(500).json({ result: error });
    });
};

exports.findByLimit = (req, res) => {
  const limit = req.query.limit || 8; // Default limit is 10, but you can change it as needed

  sequelize
    .query(
      `SELECT pr.profile, pr.id, pr.name, ca.category, pr.size_id, pr.color, pr.description, pr.quantity, pr.sale_price, pr.cost_price, pr.Barcode, pr.createdAt, pr.updatedAt, sup.name AS supplier_name,
      ca.id AS category_id, sup.id AS supplier_id
      FROM products pr
      INNER JOIN categories ca ON pr.category_id = ca.id
      INNER JOIN Suppliers sup ON pr.supplier_id = sup.id
      LIMIT :limit`,
      {
        replacements: { limit: parseInt(limit) },
        type: QueryTypes.SELECT,
      }
    )
    .then((data) => {
      if (data.length === 0) {
        return res.status(404).json({ result: 'No products found' });
      }
      return res.status(200).json({ result: data });
    })
    .catch((error) => {
      return res.status(500).json({ result: error });
    });
};


exports.findAll = (req, res) => {
  sequelize
    .query(
      `SELECT pr.profile, pr.id, pr.name, ca.category,pr.size_id, pr.color, pr.description, pr.quantity, pr.sale_price, pr.cost_price, pr.Barcode, pr.createdAt, pr.updatedAt, sup.name AS supplier_name,
      ca.id AS category_id, sup.id AS supplier_id
      FROM products pr
      INNER JOIN categories ca ON pr.category_id = ca.id
      INNER JOIN Suppliers sup ON pr.supplier_id = sup.id`,
      { type: QueryTypes.SELECT }
    )
    .then((data) => {
      return res.status(200).json({ result: data });
    })
    .catch((error) => {
      return res.status(500).json({ result: error });
    });
};

exports.findOne = (req, res) => {
  const id = req.params.id;
  sequelize
    .query(
      `SELECT pr.profile, pr.id, pr.name, ca.category,pr.size_id, pr.color, pr.description, pr.quantity, pr.sale_price, pr.cost_price, pr.Barcode, pr.createdAt, pr.updatedAt, sup.name AS supplier_name,
      ca.id AS category_id, sup.id AS supplier_id
      FROM products pr
      INNER JOIN categories ca ON pr.category_id = ca.id
      INNER JOIN Suppliers sup ON pr.supplier_id = sup.id
      WHERE pr.id = :id`,
      {
        replacements: { id: id },
        type: QueryTypes.SELECT,
      }
    )
    .then((data) => {
      if (data.length === 0) {
        return res.status(404).json({ result: 'Product not found1' });
      }
      const product = data[0];
      return res.status(200).json({ result: product });
    })
    .catch((error) => {
      return res.status(500).json({ result: error });
    });
};

exports.update = (req, res) => {
  const id = req.params.id;
  const updatedProduct = { ...req.body };
  console.log("Product ID:", id);
  console.log("Updated Product:", updatedProduct);

  Product.update(updatedProduct, { where: { id: id } })
    .then((result) => {
      if (result[0] === 1) {
        // Product updated successfully
        return res.status(200).json({ result: "Product updated successfully" });
      } else {
        // Product not found
        return res.status(404).json({ result: "Product not found" });
      }
    })
    .catch((error) => {
      return res.status(500).json({ result: error });
    });
};


exports.delete = (req, res) => {
  const id = req.params.id;
  Product.destroy({ where: { id: id } })
    .then((data) => {
      return res.status(200).json({ result: data });
    })
    .catch((error) => {
      return res.status(500).json({ result: error });
    });
};
exports.deleteAll = async (req, res) => {
  try {
    const deletedCount = await Product.destroy({ where: {} });
    return res.status(200).json({ result: `Deleted ${deletedCount} products successfully` });
  } catch (error) {
    return res.status(500).json({ result: error });
  }
};

exports.subtractQuantity = async (req, res) => {
  const id = req.params.id;
  const { quantity } = req.body;

  try {
    // Fetch the product from the database
    const product = await Product.findByPk(id);

    if (!product) {
      return res.status(404).json({ result: 'Product not found' });
    }

    // Subtract the quantity
    const newQuantity = product.quantity - quantity;

    if (newQuantity < 0) {
      return res.status(400).json({ result: 'Insufficient quantity' });
    }

    // Update the quantity in the database
    await Product.update({ quantity: newQuantity }, { where: { id: product.id } });

    // Send the response with the updated quantity
    return res.status(200).json({ result: 'Quantity subtracted successfully', newQuantity });
  } catch (error) {
    return res.status(500).json({ result: error });
  }
};

exports.subtractImportQuantity = async (req, res) => {
  const id = req.params.id;
  const { quantity } = req.body;

  try {
    // Fetch the product from the database
    const product = await Product.findByPk(id);

    if (!product) {
      return res.status(404).json({ result: 'Product not found' });
    }

    // Subtract the quantity
    const newQuantity = product.quantity + quantity;

    if (newQuantity < 0) {
      return res.status(400).json({ result: 'Insufficient quantity' });
    }

    // Update the quantity in the database
    await Product.update({ quantity: newQuantity }, { where: { id: product.id } });

    // Send the response with the updated quantity
    return res.status(200).json({ result: 'Quantity subtracted successfully', newQuantity });
  } catch (error) {
    return res.status(500).json({ result: error });
  }
};
// ______select by quantity more to less to show stock product _________
exports.getProductsByQuantity = (req, res) => {
  sequelize
    .query(
      `SELECT pr.profile, pr.id, pr.name, ca.category, pr.size_id, pr.color, pr.description, pr.quantity, pr.sale_price, pr.cost_price, pr.Barcode, pr.createdAt, pr.updatedAt, sup.name AS supplier_name,
      ca.id AS category_id, sup.id AS supplier_id
      FROM products pr
      INNER JOIN categories ca ON pr.category_id = ca.id
      INNER JOIN Suppliers sup ON pr.supplier_id = sup.id
      ORDER BY pr.quantity ASC`,
      { type: QueryTypes.SELECT }
    )
    .then((data) => {
      if (data.length === 0) {
        return res.status(404).json({ result: 'No products found' });
      }
      return res.status(200).json({ result: data });
    })
    .catch((error) => {
      return res.status(500).json({ result: error });
    });
};
// ____________________select product almost out of stock______________________
exports.getProductsAlmostOutOfStock = (req, res) => {
  sequelize
    .query(
      `SELECT pr.profile, pr.id, pr.name, ca.category, pr.size_id, pr.color, pr.description, pr.quantity, pr.sale_price, pr.cost_price, pr.Barcode, pr.createdAt, pr.updatedAt, sup.name AS supplier_name,
      ca.id AS category_id, sup.id AS supplier_id
      FROM products pr
      INNER JOIN categories ca ON pr.category_id = ca.id
      INNER JOIN Suppliers sup ON pr.supplier_id = sup.id
      WHERE pr.quantity BETWEEN 0 AND 5
      ORDER BY pr.quantity ASC`,
      { type: QueryTypes.SELECT }
    )
    .then((data) => {
      if (data.length === 0) {
        return res.status(404).json({ result: 'No products almost out of stock' });
      }
      return res.status(200).json({ result: data });
    })
    .catch((error) => {
      return res.status(500).json({ result: error });
    });
};
