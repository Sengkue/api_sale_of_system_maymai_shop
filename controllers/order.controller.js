const Order = require("../models/order.model");

// Create a new order
exports.createOrder = (req, res) => {
  const { employee_id, order_date, order_total } = req.body;

  Order.create({
    employee_id,
    order_date,
    order_total,
  })
    .then((order) => {
      res.status(201).json({ result: order });
    })
    .catch((error) => {
      res.status(500).json({ result: error });
    });
};

// Get all orders
exports.getOrders = (req, res) => {
  Order.findAll()
    .then((orders) => {
      res.status(200).json({ result: orders });
    })
    .catch((error) => {
      res.status(500).json({ result: error });
    });
};

// Get a single order by ID
exports.getOrderById = (req, res) => {
  const orderId = req.params.id;

  Order.findByPk(orderId)
    .then((order) => {
      if (!order) {
        res.status(404).json({ result: "Order not found" });
      } else {
        res.status(200).json({ result: order });
      }
    })
    .catch((error) => {
      res.status(500).json({ result: error });
    });
};

// Update an order
exports.updateOrder = (req, res) => {
  const orderId = req.params.id;
  const { employee_id, order_date, order_total } = req.body;

  Order.update(
    {
      employee_id,
      order_date,
      order_total,
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
