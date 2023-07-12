const SaleDetail = require('../models/sale_detail.model');
const Product = require('../models/product.model');
const Category = require('../models/category.model');
const Supplier = require('../models/supplier.model');

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