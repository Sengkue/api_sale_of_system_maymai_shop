const Sale = require('../models/sale.model');
const Promotion = require('../models/promotion.model');
const Customer = require('../models/customer.model');
const Employee = require('../models/employee.model');
const Location = require('../models/location.model');
const { Op } = require('sequelize'); // Import Op from Sequelize
// Select sales by status, type, and date range
exports.getSalesByStatusTypeAndDateRange = (req, res) => {
  const { sale_status, sale_type, startDate, endDate } = req.query;

  // Create an empty object to hold the where conditions
  const whereClause = {};

  // Add sale_status and sale_type conditions
  if (sale_status) {
    whereClause.sale_status = sale_status;
  }

  if (sale_type) {
    whereClause.sale_type = sale_type;
  }

  // Add date range condition if both startDate and endDate are provided
  if (startDate && endDate) {
    whereClause.sale_date = {
      [Op.between]: [new Date(startDate), new Date(endDate)],
    };
  }

  Sale.findAll({
    where: whereClause,
    include: [
      {
        model: Promotion,
        as: 'promotion',
        attributes: ['name', 'condition', 'discount'],
      },
      {
        model: Customer,
        as: 'customer',
        attributes: ['c_profile', 'c_fname', 'c_lname', 'c_gender', 'c_phone'],
      },
      {
        model: Employee,
        as: 'employee',
        attributes: ['firstName'],
      },
    ],
  })
    .then((sales) => {
      const formattedSales = sales.map((sale) => {
        const {
          id,
          customer_id,
          promotion_id,
          employee_id,
          sale_date,
          sale_total,
          sale_status,
          sale_quantity,
          createdAt,
          updatedAt,
          promotion,
          customer,
          employee,
        } = sale;

        const promotionName = promotion ? promotion.name : null;
        const promotionCondition = promotion ? promotion.condition : null;
        const promotionDiscount = promotion ? promotion.discount : null;
        const customerName = customer ? customer.c_fname : null;
        const employeeName = employee ? employee.firstName : null;

        return {
          id,
          customer_id,
          promotion_id,
          employee_id,
          sale_date,
          sale_total,
          sale_status,
          sale_quantity,
          createdAt,
          updatedAt,
          promotionName,
          promotionCondition,
          promotionDiscount,
          employeeName,
          customerName,
          customerProfile: customer ? customer.c_profile : '',
          customerPhone: customer ? customer.c_phone : '',
          customerGender: customer ? customer.c_gender : '',
        };
      });

      res.status(200).json({ result: formattedSales });
    })
    .catch((error) => {
      res.status(500).json({ error: error.message });
    });
};
// ______________________________select all_______________
exports.getAllSales = (req, res) => {
  Sale.findAll({
    include: [
      {
        model: Promotion,
        as: 'promotion',
        attributes: ['name', 'condition', 'discount'],
      },
      {
        model: Customer,
        as: 'customer',
        attributes: ['c_fname'],
      },
      {
        model: Employee,
        as: 'employee',
        attributes: ['firstName'],
      },
    ],
  })
    .then((sales) => {
      const formattedSales = sales.map((sale) => {
        const {
          id,
          customer_id,
          promotion_id,
          employee_id,
          sale_date,
          sale_total,
          sale_type,
          sale_status,
          sale_quantity,
          createdAt,
          updatedAt,
          promotion,
          customer,
          employee,
        } = sale;

        const promotionName = promotion ? promotion.name : null;
        const promotionCondition = promotion ? promotion.condition : null;
        const promotionDiscount = promotion ? promotion.discount : null;
        const customerName = customer ? customer.c_fname : null;
        const employeeName = employee ? employee.firstName : null;

        return {
          id,
          customer_id,
          promotion_id,
          employee_id,
          sale_date,
          sale_total,
          sale_type,
          sale_status,
          sale_quantity,
          createdAt,
          updatedAt,
          promotionName,
          promotionCondition,
          promotionDiscount,
          customerName,
          employeeName,
        };
      });

      res.status(200).json({ result: formattedSales });
    })
    .catch((error) => {
      res.status(500).json({ error: error.message });
    });
};

// _________________________________select by sale id_________

exports.getSaleById = (req, res) => {
  const { id } = req.params;

  Sale.findByPk(id, {
    include: [
      {
        model: Promotion,
        as: 'promotion',
        attributes: ['name', 'condition', 'discount'],
      },
      {
        model: Customer,
        as: 'customer',
        attributes: ['c_fname'],
      },
      {
        model: Employee,
        as: 'employee',
        attributes: ['firstName'],
      },
    ],
  })
    .then((sale) => {
      if (sale) {
        const {
          id,
          customer_id,
          promotion_id,
          employee_id,
          sale_date,
          sale_total,
          sale_type,
          sale_status,
          sale_quantity,
          createdAt,
          updatedAt,
          promotion,
          customer,
          employee,
        } = sale;

        const promotionName = promotion ? promotion.name : null;
        const promotionCondition = promotion ? promotion.condition : null;
        const promotionDiscount = promotion ? promotion.discount : null;
        const customerName = customer ? customer.c_fname : null;
        const employeeName = employee ? employee.firstName : null;

        res.status(200).json({
          result: {
            id,
            customer_id,
            promotion_id,
            employee_id,
            sale_date,
            sale_total,
            sale_type,
            sale_status,
            sale_quantity,
            createdAt,
            updatedAt,
            promotionName,
            promotionCondition,
            promotionDiscount,
            customerName,
            employeeName,
          },
        });
      } else {
        res.status(404).json({ result: 'Sale not found' });
      }
    })
    .catch((error) => {
      res.status(500).json({ error: error.message });
    });
};
//__________________________________create post _________________

exports.createSale = (req, res) => {
  const { customer_id, promotion_id, employee_id,location_id, payment, sale_date, sale_total, sale_type, sale_status, sale_quantity } = req.body;

  Sale.create({ customer_id, promotion_id, employee_id, location_id, payment, sale_date, sale_total, sale_type, sale_status, sale_quantity })
    .then((sale) => {
      res.status(201).json({ result: sale });
    })
    .catch((error) => {
      res.status(500).json({ error: error.message });
    });
};
// ________________________________update sale______________________

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
          res.status(404).json({ result: 'Sale not found' });
        }
      })
      .catch((error) => {
        res.status(500).json({ error: error.message });
      });
  };
  // ______________________________updata sale status______________

  exports.updateSaleStatus = (req, res) => {
    const { id } = req.params;
    const { sale_status } = req.body;
  
    Sale.findByPk(id)
      .then((sale) => {
        if (sale) {
          sale
            .update({ sale_status })
            .then((updatedSale) => {
              res.status(200).json({ result: updatedSale });
            })
            .catch((error) => {
              res.status(500).json({ error: error.message });
            });
        } else {
          res.status(404).json({ result: 'Sale not found' });
        }
      })
      .catch((error) => {
        res.status(500).json({ error: error.message });
      });
  };
  //_______________________________delete sale _____________________

exports.deleteSale = (req, res) => {
  const { id } = req.params;

  Sale.findByPk(id)
    .then((sale) => {
      if (sale) {
        sale.destroy().then(() => {
          res.status(204).json();
        });
      } else {
        res.status(404).json({ result: 'Sale not found' });
      }
    })
    .catch((error) => {
      res.status(500).json({ error: error.message });
    });
};
//______________________________________select sale by type______________

exports.getSalesByType = (req, res) => {
  const { sale_type } = req.params;

  Sale.findAll({
    where: { sale_type: sale_type },
    include: [
      {
        model: Promotion,
        as: 'promotion',
        attributes: ['name', 'condition', 'discount'],
      },
      {
        model: Customer,
        as: 'customer',
        attributes: ['c_fname'],
      },
      {
        model: Employee,
        as: 'employee',
        attributes: ['firstName'],
      },
    ],
  })
    .then((sales) => {
      const formattedSales = sales.map((sale) => {
        const {
          id,
          customer_id,
          promotion_id,
          employee_id,
          sale_date,
          sale_total,
          sale_status,
          sale_quantity,
          createdAt,
          updatedAt,
          promotion,
          customer,
          employee,
        } = sale;

        const promotionName = promotion ? promotion.name : null;
        const promotionCondition = promotion ? promotion.condition : null;
        const promotionDiscount = promotion ? promotion.discount : null;
        const customerName = customer ? customer.c_fname : null;
        const employeeName = employee ? employee.firstName : null;

        return {
          id,
          customer_id,
          promotion_id,
          employee_id,
          sale_date,
          sale_total,
          sale_type,
          sale_status,
          sale_quantity,
          createdAt,
          updatedAt,
          promotionName,
          promotionCondition,
          promotionDiscount,
          customerName,
          employeeName,
        };
      });

      res.status(200).json({ result: formattedSales });
    })
    .catch((error) => {
      res.status(500).json({ error: error.message });
    });
};
//_______________________________________select by type and status_____________

exports.getSalesByStatusAndType = (req, res) => {
  const { sale_status, sale_type } = req.params;

  Sale.findAll({
    where: { sale_status, sale_type },
    include: [
      {
        model: Promotion,
        as: 'promotion',
        attributes: ['name', 'condition', 'discount'],
      },
      {
        model: Customer,
        as: 'customer',
        attributes: ['c_profile','c_fname','c_lname','c_gender','c_phone'],
      },
      {
        model: Employee,
        as: 'employee',
        attributes: ['firstName'],
      },
    ],
  })
    .then((sales) => {
      const formattedSales = sales.map((sale) => {
        const {
          id,
          customer_id,
          promotion_id,
          employee_id,
          sale_date,
          sale_total,
          sale_status,
          sale_quantity,
          createdAt,
          updatedAt,
          promotion,
          customer,
          employee,
        } = sale;

        const promotionName = promotion ? promotion.name : null;
        const promotionCondition = promotion ? promotion.condition : null;
        const promotionDiscount = promotion ? promotion.discount : null;
        const customerName = customer ? customer.c_fname: null;
        const employeeName = employee ? employee.firstName : null;

        return {
          id,
          customer_id,
          promotion_id,
          employee_id,
          sale_date,
          sale_total,
          sale_type,
          sale_status,
          sale_quantity,
          createdAt,
          updatedAt,
          promotionName,
          promotionCondition,
          promotionDiscount,
          employeeName,
          customerName,
          customerProfile:customer? customer.c_profile:'',
          customerPhone:customer? customer.c_phone:'',
          customerGender:customer? customer.c_gender:'',
          
        };
      });

      res.status(200).json({ result: formattedSales });
    })
    .catch((error) => {
      res.status(500).json({ error: error.message });
    });
};


// _____________________________________select sell online by id________________

exports.getSaleOnlineById = (req, res) => {
  const { id } = req.params;

  Sale.findByPk(id, {
    include: [
      {
        model: Promotion,
        as: 'promotion',
        attributes: ['name', 'condition', 'discount'],
      },
      {
        model: Customer,
        as: 'customer',
        attributes: { exclude: ['createdAt', 'updatedAt'] },
      },
      {
        model: Employee,
        as: 'employee',
        attributes: ['firstName'],
      },
      {
        model: Location,
        as: 'location',
        attributes: { exclude: ['createdAt', 'updatedAt','customer_id'] },
      },
    ],
  })
    .then((sale) => {
      if (sale) {
        const {
          id,
          customer_id,
          promotion_id,
          employee_id,
          sale_date,
          sale_total,
          sale_type,
          sale_status,
          sale_quantity,
          payment,
          createdAt,
          updatedAt,
          promotion,
          customer,
          employee,
          location,
        } = sale;

        const promotionName = promotion ? promotion.name : null;
        const promotionCondition = promotion ? promotion.condition : null;
        const promotionDiscount = promotion ? promotion.discount : null;
        const customerData = customer ? customer.toJSON() : null;
        const employeeName = employee ? employee.firstName : null;
        const locationData = location ? location.toJSON() : null;

        res.status(200).json({
          result: {
            id,
            customer_id,
            promotion_id,
            employee_id,
            sale_date,
            sale_total,
            sale_type,
            sale_status,
            sale_quantity,
            payment,
            createdAt,
            updatedAt,
            promotionName,
            promotionCondition,
            promotionDiscount,
            customer: customerData,
            employeeName,
            location: locationData, // Include all fields from the location model
          },
        });
      } else {
        res.status(404).json({ result: 'Sale not found' });
      }
    })
    .catch((error) => {
      res.status(500).json({ error: error.message });
    });
};
//__________________________select by statu online type  customer id
exports.getSaleByStatusTypeCustomerId = (req, res) => {
  const { sale_status, sale_type, customer_id } = req.params;

  // Create an empty object to hold the where conditions
  const whereClause = {};

  // Add sale_status and sale_type conditions
  if (sale_status) {
    whereClause.sale_status = sale_status;
  }

  if (sale_type) {
    whereClause.sale_type = sale_type;
  }

  // Add customer_id condition if provided
  if (customer_id) {
    whereClause.customer_id = customer_id;
  }

  Sale.findAll({
    where: whereClause,
    include: [
      {
        model: Promotion,
        as: 'promotion',
        attributes: ['name', 'condition', 'discount'],
      },
      {
        model: Customer,
        as: 'customer',
        attributes: ['c_profile', 'c_fname', 'c_lname', 'c_gender', 'c_phone'],
      },
      {
        model: Employee,
        as: 'employee',
        attributes: ['firstName'],
      },
    ],
  })
    .then((sales) => {
      const formattedSales = sales.map((sale) => {
        const {
          id,
          customer_id,
          promotion_id,
          employee_id,
          sale_date,
          sale_total,
          sale_status,
          sale_quantity,
          createdAt,
          updatedAt,
          promotion,
          customer,
          employee,
        } = sale;

        const promotionName = promotion ? promotion.name : null;
        const promotionCondition = promotion ? promotion.condition : null;
        const promotionDiscount = promotion ? promotion.discount : null;
        const customerName = customer ? customer.c_fname : null;
        const employeeName = employee ? employee.firstName : null;

        return {
          id,
          customer_id,
          promotion_id,
          employee_id,
          sale_date,
          sale_total,
          sale_type,
          sale_status,
          sale_quantity,
          createdAt,
          updatedAt,
          promotionName,
          promotionCondition,
          promotionDiscount,
          employeeName,
          customerName,
          customerProfile: customer ? customer.c_profile : '',
          customerPhone: customer ? customer.c_phone : '',
          customerGender: customer ? customer.c_gender : '',
        };
      });

      res.status(200).json({ result: formattedSales });
    })
    .catch((error) => {
      res.status(500).json({ error: error.message });
    });
};
