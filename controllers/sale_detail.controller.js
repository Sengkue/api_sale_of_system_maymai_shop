const SaleDetail = require('../models/sale_detail.model');
const Product = require('../models/product.model');
const Category = require('../models/category.model');
const Supplier = require('../models/supplier.model');
const sequelize = require('../config/db');
const { Op } = require('sequelize');

exports.getAllSaleDetails = (req, res) => {
  SaleDetail.findAll()
    .then((saleDetails) => {
      res.status(200).json({ result: saleDetails });
    })
    .catch((error) => {
      res.status(500).json({ error: error.message });
    });
};

exports.getSaleDetailById = (req, res) => {
  const { id } = req.params;

  SaleDetail.findByPk(id)
    .then((saleDetail) => {
      if (saleDetail) {
        res.status(200).json({ result: saleDetail });
      } else {
        res.status(404).json({ result: "Sale detail not found" });
      }
    })
    .catch((error) => {
      res.status(500).json({ error: error.message });
    });
};

exports.createSaleDetail = (req, res) => {
  const { sale_id, product_id, sale_price, quantity} = req.body;

  SaleDetail.create({ sale_id, product_id, sale_price, quantity })
    .then((createdSaleDetail) => {
      res.status(201).json({ result: createdSaleDetail });
    })
    .catch((error) => {
      res.status(500).json({ error: error.message });
    });
};
// ______________update saleDetail______________
exports.updateSaleDetail = (req, res) => {
  const { id } = req.params;
  const { sale_id, product_id, sale_price, quantity} = req.body;

  SaleDetail.findByPk(id)
    .then((saleDetail) => {
      if (saleDetail) {
        saleDetail
          .update({ sale_id, product_id, sale_price, quantity})
          .then((updatedSaleDetail) => {
            res.status(200).json({ result: updatedSaleDetail });
          })
          .catch((error) => {
            res.status(500).json({ error: error.message });
          });
      } else {
        res.status(404).json({ result: "Sale detail not found" });
      }
    })
    .catch((error) => {
      res.status(500).json({ error: error.message });
    });
};
// ________________delete saleDetail____________________
exports.deleteSaleDetail = (req, res) => {
  const { id } = req.params;

  SaleDetail.destroy({ where: { id } })
    .then(() => {
      res.status(204).end();
    })
    .catch((error) => {
      res.status(500).json({ error: error.message });
    });
};
// ___________________get saleDetail by id_____________________
exports.getSaleDetailsBySaleId = (req, res) => {
  const { sale_id } = req.params;

  SaleDetail.findAll({
    where: { sale_id },
    include: [
      {
        model: Product,
        attributes: [
          'id',
          'name',
          'profile',
          'color',
          'size_id',
        ],
        include: [
          {
            model: Category,
            attributes: ['category'],
            as: 'category',
          },
          {
            model: Supplier,
            attributes: ['name'],
            as: 'supplier',
          },
        ],
      },
    ],
  })
    .then((saleDetails) => {
      if (saleDetails.length === 0) {
        return res
          .status(404)
          .json({ result: 'No sale details found for the specified sale' });
      }

      const result = saleDetails.map((saleDetail) => {
        const {
          id,
          sale_id,
          sale_price,
          quantity,
          product: {
            id: product_id,
            name: productName,
            description: productDescription,
            profile,
            color,
            size_id,
            category: { category: categoryName },
            supplier: { name: supplierName },
          },
          createdAt,
          updatedAt,
        } = saleDetail.toJSON();

        return {
          id,
          sale_id,
          product_id,
          productName,
          productDescription,
          sale_price,
          quantity,
          profile,
          categoryName,
          supplierName,
          color,
          size_id,
          createdAt,
          updatedAt,
        };
      });

      return res.status(200).json({ result });
    })
    .catch((error) => {
      return res.status(500).json({ result: error.message });
    });
};
// ________________get sale detail summary____________________
exports.getSaleDetailSummary = (req, res) => {
  SaleDetail.findAll({
    attributes: [
      [sequelize.fn('SUM', sequelize.col('quantity')), 'totalQuantity'],
      [sequelize.fn('SUM', sequelize.col('sale_price')), 'totalSalePrice'],
    ],
  })
    .then((summary) => {
      const { totalQuantity, totalSalePrice } = summary[0].toJSON();
      res.status(200).json({ totalQuantity, totalSalePrice });
    })
    .catch((error) => {
      res.status(500).json({ error: error.message });
    });
};
// __________________________get Sale Detail Summary Group________________________
exports.getSaleDetailSummaryGroup = (req, res) => {
  const limit = req.query.limit || 10; // Set the default limit to 10, or you can modify it as per your requirement

  SaleDetail.findAll({
    attributes: [
      'product_id',
      [sequelize.fn('SUM', sequelize.col('SaleDetail.quantity')), 'totalQuantity'],
      [sequelize.fn('SUM', sequelize.col('SaleDetail.sale_price')), 'totalSalePrice'],
    ],
    group: ['product_id'],
    order: [[sequelize.literal('totalQuantity'), 'DESC']],
    limit: parseInt(limit, 10), // Parse the limit value to ensure it's an integer
    include: [
      {
        model: Product,
        attributes: ['id', 'name'],
        as: 'product',
      },
    ],
  })
    .then((summary) => {
      const result = summary.map((row) => {
        const { product_id, totalQuantity, totalSalePrice, product } = row.toJSON();

        const productName = product ? product.name : 'Product Not Found';

        return {
          product_id,
          totalQuantity: Number(totalQuantity),
          totalSalePrice: Number(totalSalePrice),
          productName,
        };
      });

      const overallSum = result.reduce(
        (accumulator, { totalQuantity, totalSalePrice }) => {
          accumulator.totalQuantity += totalQuantity;
          accumulator.totalSalePrice += totalSalePrice;
          return accumulator;
        },
        { totalQuantity: 0, totalSalePrice: 0 }
      );

      res.status(200).json({ overallSum, result });
    })
    .catch((error) => {
      res.status(500).json({ error: error.message });
    });
};
// _______________________ select sale SaleDetail. in month_______________
exports.getSaleDetailSummaryByMonth = (req, res) => {
  const { month, year, limit } = req.query;

  SaleDetail.findAll({
    attributes: [
      'product_id',
      [sequelize.fn('SUM', sequelize.col('SaleDetail.quantity')), 'totalQuantity'],
      [sequelize.fn('SUM', sequelize.col('SaleDetail.sale_price')), 'totalSalePrice'],
    ],
    group: ['product_id'],
    order: [[sequelize.literal('totalQuantity'), 'DESC']],
    limit: parseInt(limit, 10),
    include: [
      {
        model: Product,
        attributes: ['id', 'name'],
        as: 'product',
      },
    ],
    where: {
      [Op.and]: [
        sequelize.where(sequelize.fn('MONTH', sequelize.col('SaleDetail.createdAt')), parseInt(month, 10)),
        sequelize.where(sequelize.fn('YEAR', sequelize.col('SaleDetail.createdAt')), parseInt(year, 10))
      ]
    },
  })
    .then((summary) => {
      const result = summary.map((row) => {
        const { product_id, totalQuantity, totalSalePrice, product } = row.toJSON();

        const productName = product ? product.name : 'Product Not Found';

        return {
          product_id,
          totalQuantity: Number(totalQuantity),
          totalSalePrice: Number(totalSalePrice),
          productName,
        };
      });

      const overallSum = result.reduce(
        (accumulator, { totalQuantity, totalSalePrice }) => {
          accumulator.totalQuantity += totalQuantity;
          accumulator.totalSalePrice += totalSalePrice;
          return accumulator;
        },
        { totalQuantity: 0, totalSalePrice: 0 }
      );

      res.status(200).json({ overallSum, result });
    })
    .catch((error) => {
      res.status(500).json({ error: error.message });
    });
};
// ___________________________ select sale detail in year____________________
exports.getSaleDetailSummaryByYear = (req, res) => {
  const { year, limit } = req.query;

  SaleDetail.findAll({
    attributes: [
      'product_id',
      [sequelize.fn('SUM', sequelize.col('SaleDetail.quantity')), 'totalQuantity'],
      [sequelize.fn('SUM', sequelize.col('SaleDetail.sale_price')), 'totalSalePrice'],
    ],
    group: ['product_id'],
    order: [[sequelize.literal('totalQuantity'), 'DESC']],
    limit: parseInt(limit, 10),
    include: [
      {
        model: Product,
        attributes: ['id', 'name'],
        as: 'product',
      },
    ],
    where: {
      [Op.and]: [
        sequelize.where(sequelize.fn('YEAR', sequelize.col('SaleDetail.createdAt')), parseInt(year, 10))
      ]
    },
  })
    .then((summary) => {
      const result = summary.map((row) => {
        const { product_id, totalQuantity, totalSalePrice, product } = row.toJSON();

        const productName = product ? product.name : 'Product Not Found';

        return {
          product_id,
          totalQuantity: Number(totalQuantity),
          totalSalePrice: Number(totalSalePrice),
          productName,
        };
      });

      const overallSum = result.reduce(
        (accumulator, { totalQuantity, totalSalePrice }) => {
          accumulator.totalQuantity += totalQuantity;
          accumulator.totalSalePrice += totalSalePrice;
          return accumulator;
        },
        { totalQuantity: 0, totalSalePrice: 0 }
      );

      res.status(200).json({ overallSum, result });
    })
    .catch((error) => {
      res.status(500).json({ error: error.message });
    });
};


// ____________________________select product popular________________________
exports.getPopularProduct = (req, res) => {
  SaleDetail.findAll({
    attributes: [
      'product_id',
      [sequelize.fn('SUM', sequelize.col('SaleDetail.quantity')), 'totalQuantity'],
      [sequelize.fn('SUM', sequelize.col('SaleDetail.sale_price')), 'totalSalePrice'],
    ],
    group: ['product_id'],
    order: [[sequelize.literal('totalQuantity'), 'DESC']],
  })
    .then((summary) => {
      const productIds = summary.map((row) => row.product_id);

      return Product.findAll({
        where: { id: productIds },
      })
        .then((products) => {
          const result = summary.map((row) => {
            const { product_id, totalQuantity, totalSalePrice } = row.toJSON();
            const product = products.find((p) => p.id === product_id);
            return {
              product_id,
              totalQuantity: Number(totalQuantity),
              totalSalePrice: Number(totalSalePrice),
              product,
            };
          });

          const overallSum = result.reduce(
            (accumulator, { totalQuantity, totalSalePrice }) => {
              accumulator.totalQuantity += totalQuantity;
              accumulator.totalSalePrice += totalSalePrice;
              return accumulator;
            },
            { totalQuantity: 0, totalSalePrice: 0 }
          );

          res.status(200).json({ overallSum, result });
        });
    })
    .catch((error) => {
      res.status(500).json({ error: error.message });
    });
};

// __________________select product hot top of sell ______________________
exports.getHot = (req, res) => {
  const limit = req.query.limit || 4; // Use the 'limit' query parameter if provided, otherwise default to 4

  SaleDetail.findAll({
    attributes: [
      'product_id',
      [sequelize.fn('SUM', sequelize.col('SaleDetail.quantity')), 'totalQuantity'],
      [sequelize.fn('SUM', sequelize.col('SaleDetail.sale_price')), 'totalSalePrice'],
    ],
    group: ['product_id'],
    order: [[sequelize.literal('totalQuantity'), 'DESC']],
    limit: parseInt(limit), // Convert the 'limit' to a number before using it
  })
    .then((summary) => {
      const productIds = summary.map((row) => row.product_id);

      return Product.findAll({
        where: { id: productIds },
      })
        .then((products) => {
          const result = summary.map((row) => {
            const { product_id, totalQuantity, totalSalePrice } = row.toJSON();
            const product = products.find((p) => p.id === product_id) || {}; // Use empty object as default value if product is not found
            return {
              product_id,
              totalQuantity: Number(totalQuantity),
              totalSalePrice: Number(totalSalePrice),
              productCategory_id: product.category_id || null, // Use null as default value if category_id is missing
              productDame: product.name || '', // Use empty string as default value if name is missing
              productDescription: product.description || '', // Use empty string as default value if description is missing
              productSale_price: product.sale_price || null, // Use null as default value if sale_price is missing
              productCost_price: product.cost_price || null, // Use null as default value if cost_price is missing
              productBarcode: product.Barcode || '', // Use empty string as default value if Barcode is missing
              productSupplier_id: product.supplier_id || null, // Use null as default value if supplier_id is missing
              profile: product.profile || '', // Use empty string as default value if profile is missing
              productQuantity: product.quantity || null, // Use null as default value if quantity is missing
              productSize_id: product.size_id || '', // Use empty string as default value if size_id is missing
              productColor: product.color || '', // Use empty string as default value if color is missing
            };
          });

          const overallSum = result.reduce(
            (accumulator, { totalQuantity, totalSalePrice }) => {
              accumulator.totalQuantity += totalQuantity;
              accumulator.totalSalePrice += totalSalePrice;
              return accumulator;
            },
            { totalQuantity: 0, totalSalePrice: 0 }
          );

          res.status(200).json({ overallSum, result });
        });
    })
    .catch((error) => {
      res.status(500).json({ error: error.message });
    });
};
