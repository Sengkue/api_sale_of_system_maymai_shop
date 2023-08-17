const { DataTypes } = require("sequelize");
const sequelize = require("../config/db");
const Product = require("./product.model");
const Order = require("./order.model");

const OrderDetail = sequelize.define(
  "order_details",
  {
    id: {
      type: DataTypes.UUID,
      allowNull: false,
      defaultValue: DataTypes.UUIDV4,
      primaryKey: true,
    },
    product_id: {
      type: DataTypes.UUID,
      allowNull: true,
    },
    order_quantity: {
      type: DataTypes.INTEGER,
      allowNull: true,
    },
    order_id: {
      type: DataTypes.STRING,
      allowNull: true,
    },
    color: { // Add the 'color' field
      type: DataTypes.STRING,
      allowNull: true,
    },
    size: { // Add the 'size' field
      type: DataTypes.STRING,
      allowNull: true,
    },
  },
  {
    sequelize,
    timestamps: true,
    tableName: "order_details",
  }
);

OrderDetail.belongsTo(Order, { foreignKey: "order_id", onDelete: "CASCADE", onUpdate: "CASCADE" });
OrderDetail.belongsTo(Product, { foreignKey: "product_id", onDelete: "CASCADE", onUpdate: "CASCADE" });

module.exports = OrderDetail;
