const Sale = require("../models/sale.model");

exports.getAllSales = (req, res) => {
  Sale.findAll()
    .then((sales) => {
      res.status(200).json({ result: sales });
    })
    .catch((error) => {
      res.status(500).json({ error: error.message });
    });
};

exports.getSaleById = (req, res) => {
  const { id } = req.params;

  Sale.findByPk(id)
    .then((sale) => {
      if (sale) {
        res.status(200).json({ result: sale });
      } else {
        res.status(404).json({ result: "Sale not found" });
      }
    })
    .catch((error) => {
      res.status(500).json({ error: error.message });
    });
};

exports.createSale = (req, res) => {
  const { customer_id, promotion_id, employee_id, sale_date, sale_total, sale_type, sale_status, sale_quantity } = req.body;

  Sale.create({ customer_id, promotion_id, employee_id, sale_date, sale_total, sale_type, sale_status, sale_quantity })
    .then((sale) => {
      res.status(201).json({ result: sale });
    })
    .catch((error) => {
      res.status(500).json({ error: error.message });
    });
};

exports.updateSale = (req, res) => {
    const { id } = req.params;
    const { customer_id, promotion_id, employee_id, sale_date, sale_total, sale_type, sale_status, sale_quantity } = req.body;
  
    Sale.findByPk(id)
      .then((sale) => {
        if (sale) {
          sale
            .update({ customer_id, promotion_id, employee_id, sale_date, sale_total, sale_type, sale_status, sale_quantity })
            .then((updatedSale) => {
              res.status(200).json({ result: updatedSale });
            })
            .catch((error) => {
              res.status(500).json({ error: error.message });
            });
        } else {
          res.status(404).json({ result: "Sale not found" });
        }
      })
      .catch((error) => {
        res.status(500).json({ error: error.message });
      });
  };
  

exports.deleteSale = (req, res) => {
  const { id } = req.params;

  Sale.findByPk(id)
    .then((sale) => {
      if (sale) {
        sale.destroy().then(() => {
          res.status(204).json();
        });
      } else {
        res.status(404).json({ result: "Sale not found" });
      }
    })
    .catch((error) => {
      res.status(500).json({ error: error.message });
    });
};
