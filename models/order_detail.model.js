const { DataTypes } = require("sequelize");
const sequelize = require("../config/db");

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
    order_price: {
      type: DataTypes.FLOAT,
      allowNull: false,
    },
    order_quantity: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
  },
  {
    sequelize,
    timestamps: true,
  }
);

module.exports = OrderDetail;
