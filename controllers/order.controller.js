const Order = require("../models/order.model");
const Employee = require("../models/employee.model");
const { Op } = require("sequelize");

// Create a new order
exports.createOrder = (req, res) => {
  const { employee_id, order_date, status } = req.body; // Add 'status' field
  Order.create({
    employee_id,
    order_date,
    status, // Assign the provided status value
  })
    .then((order) => {
      res.status(201).json({ result: order });
    })
    .catch((error) => {
      res.status(500).json({ result: error });
    });
};

// Get all orders with employee's first name as employeeName


exports.getOrders = (req, res) => {
  const currentDate = new Date();
  Order.findAll({
    where: {
      order_date: {
        [Op.lt]: currentDate, // Select orders with order_date before the current date and time
      },
    },
    include: {
      model: Employee,
      attributes: ["firstName"],
      as: "employee",
    },
    raw: true,
    nest: true,
    order: [["order_date", "DESC"]], // Order by order_date in descending order
  })
    .then((orders) => {
      const modifiedOrders = orders.map((order) => {
        return {
          ...order,
          employeeName: order.employee.firstName,
        };
      });
      delete modifiedOrders[0].employee;
      res.status(200).json({ result: modifiedOrders });
    })
    .catch((error) => {
      res.status(500).json({ result: error });
    });
};

// Get a single order by ID with employee's first name as employeeName
exports.getOrderById = (req, res) => {
  const orderId = req.params.id;

  Order.findByPk(orderId, {
    include: {
      model: Employee,
      attributes: ["firstName"],
      as: "employee",
    },
    raw: true, // Get raw data instead of Sequelize instances
    nest: true, // Nest the data in the required structure
  })
    .then((order) => {
      if (!order) {
        res.status(404).json({ result: "Order not found" });
      } else {
        const modifiedOrder = {
          ...order,
          employeeName: order.employee.firstName,
        };
        delete modifiedOrder.employee; // Remove the employee object
        res.status(200).json({ result: modifiedOrder });
      }
    })
    .catch((error) => {
      res.status(500).json({ result: error });
    });
};

// Get orders by status
exports.getOrdersByStatus = (req, res) => {
  const { status } = req.params;

  Order.findAll({
    where: { status },
    include: {
      model: Employee,
      attributes: ["firstName"],
      as: "employee",
    },
    raw: true,
    nest: true,
  })
    .then((orders) => {
      const modifiedOrders = orders.map((order) => {
        return {
          ...order,
          employeeName: order.employee.firstName,
        };
      });
      delete modifiedOrders[0].employee;
      res.status(200).json({ result: modifiedOrders });
    })
    .catch((error) => {
      res.status(500).json({ result: error });
    });
};
// Update an order
exports.updateOrder = (req, res) => {
  const orderId = req.params.id;
  const { employee_id, order_date } = req.body;

  Order.update(
    {
      employee_id,
      order_date,
    },
    {
      where: { id: orderId },
    }
  )
    .then((result) => {
      if (result[0] === 0) {
        res.status(404).json({ result: "Order not found" });
      } else {
        res.status(200).json({ result: "Order updated successfully" });
      }
    })
    .catch((error) => {
      res.status(500).json({ result: error });
    });
};

// Delete an order
exports.deleteOrder = (req, res) => {
  const orderId = req.params.id;

  Order.destroy({
    where: { id: orderId },
  })
    .then((result) => {
      if (result === 0) {
        res.status(404).json({ result: "Order not found" });
      } else {
        res.status(200).json({ result: "Order deleted successfully" });
      }
    })
    .catch((error) => {
      res.status(500).json({ result: error });
    });
};

// Update order status
exports.updateOrderStatus = (req, res) => {
  const orderId = req.params.id;
  const { status } = req.body;

  Order.update(
    {
      status,
    },
    {
      where: { id: orderId },
    }
  )
    .then((result) => {
      if (result[0] === 0) {
        res.status(404).json({ result: "Order not found" });
      } else {
        res.status(200).json({ result: "Order status updated successfully" });
      }
    })
    .catch((error) => {
      res.status(500).json({ result: error });
    });
};
