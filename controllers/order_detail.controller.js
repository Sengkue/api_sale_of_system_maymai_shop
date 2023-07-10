const OrderDetail = require("../models/order_detail.model");
const Product = require("../models/product.model");
const Order = require("../models/order.model");
const Category = require("../models/category.model");

// Create a new order detail
exports.createOrderDetail = (req, res) => {
  const { product_id, order_quantity, order_id } = req.body;

  OrderDetail.create({
    product_id,
    order_quantity,
    order_id,
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
  OrderDetail.findAll({
    include: [
      {
        model: Product,
        as: "product",
        attributes: [
          "id",
          "name",
          "description",
          "sale_price",
          "cost_price",
          "profile",
          "size_id", // Include the size_id field
          "color", // Include the color field
        ],
        include: [
          {
            model: Category,
            as: "category",
            attributes: ["category"],
          },
        ],
      },
    ],
  })
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

  OrderDetail.findByPk(orderDetailId, {
    include: [
      {
        model: Product,
        as: "product",
        attributes: [
          "id",
          "name",
          "description",
          "sale_price",
          "cost_price",
          "profile",
          "size_id", // Include the size_id field
          "color", // Include the color field
        ],
        include: [
          {
            model: Category,
            as: "category",
            attributes: ["category"],
          },
        ],
      },
    ],
  })
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
  const { product_id, order_quantity, order_id } = req.body;

  OrderDetail.update(
    {
      product_id,
      order_quantity,
      order_id,
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

// Get order details by order ID
exports.getOrderDetailsByOrderId = (req, res) => {
  const { order_id } = req.params;

  OrderDetail.findAll({
    where: { order_id },
    include: [
      {
        model: Product,
        as: "product",
        include: [{ model: Category, as: "category" }],
      },
    ],
  })
    .then((data) => {
      if (data.length === 0) {
        return res
          .status(404)
          .json({ result: "No order details found for the specified order" });
      }

      const result = data.map((orderDetail) => {
        const {
          id,
          order_id,
          order_quantity,
          createdAt,
          updatedAt,
          product: {
            id: product_id,
            name: productName,
            description: productDescription,
            sale_price,
            cost_price,
            profile,
            color,
            size_id,
            category: { category: categoryName },
          },
        } = orderDetail;

        return {
          id,
          order_id,
          order_quantity,
          createdAt,
          updatedAt,
          product_id,
          productName,
          productDescription,
          sale_price,
          cost_price,
          profile,
          categoryName,
          color,
          size_id
        };
      });

      return res.status(200).json({ result });
    })
    .catch((error) => {
      return res.status(500).json({ result: error });
    });
};
