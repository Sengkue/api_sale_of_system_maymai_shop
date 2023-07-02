const OrderDetail = require("../models/order_detail.model");

// Create a new order detail
exports.createOrderDetail = (req, res) => {
  const { product_id, order_price, order_quantity } = req.body;

  OrderDetail.create({
    product_id,
    order_price,
    order_quantity,
  })
    .then((orderDetail) => {
      res.status(201).json({ result: orderDetail });
    })
    .catch((error) => {
      res.status(500).json({ result: error });
    });
};

// Get all order details
exports.getOrderDetails = (req, res) => {
  OrderDetail.findAll()
    .then((orderDetails) => {
      res.status(200).json({ result: orderDetails });
    })
    .catch((error) => {
      res.status(500).json({ result: error });
    });
};

// Get a single order detail by ID
exports.getOrderDetailById = (req, res) => {
  const orderDetailId = req.params.id;

  OrderDetail.findByPk(orderDetailId)
    .then((orderDetail) => {
      if (!orderDetail) {
        res.status(404).json({ result: "Order detail not found" });
      } else {
        res.status(200).json({ result: orderDetail });
      }
    })
    .catch((error) => {
      res.status(500).json({ result: error });
    });
};

// Update an order detail
exports.updateOrderDetail = (req, res) => {
  const orderDetailId = req.params.id;
  const { product_id, order_price, order_quantity } = req.body;

  OrderDetail.update(
    {
      product_id,
      order_price,
      order_quantity,
    },
    {
      where: { id: orderDetailId },
    }
  )
    .then((result) => {
      if (result[0] === 0) {
        res.status(404).json({ result: "Order detail not found" });
      } else {
        res.status(200).json({ result: "Order detail updated successfully" });
      }
    })
    .catch((error) => {
      res.status(500).json({ result: error });
    });
};

// Delete an order detail
exports.deleteOrderDetail = (req, res) => {
  const orderDetailId = req.params.id;

  OrderDetail.destroy({
    where: { id: orderDetailId },
  })
    .then((result) => {
      if (result === 0) {
        res.status(404).json({ result: "Order detail not found" });
      } else {
        res.status(200).json({ result: "Order detail deleted successfully" });
      }
    })
    .catch((error) => {
      res.status(500).json({ result: error });
    });
};
