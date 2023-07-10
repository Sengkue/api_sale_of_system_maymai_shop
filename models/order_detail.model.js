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
      allowNull: false,
    },
    order_quantity: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    order_id: {
      type: DataTypes.STRING,
      allowNull: false,
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
