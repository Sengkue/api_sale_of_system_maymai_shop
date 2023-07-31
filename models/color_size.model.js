const { DataTypes } = require("sequelize");
const sequelize = require("../config/db");

const ColorSize = sequelize.define(
  "color_sizes",
  {
    id: {
      type: DataTypes.UUID,
      allowNull: false,
      primaryKey: true,
      defaultValue: DataTypes.UUIDV4,
    },
    product_id: {
      type: DataTypes.UUID,
      allowNull: true,
    },
    color: {
      type: DataTypes.STRING,
      allowNull: true,
    },
    size: {
      type: DataTypes.STRING,
      allowNull: true,
    },
    quantity: {
      type: DataTypes.INTEGER,
      allowNull: true,
      defaultValue: 0,
    },
    cost_price: {
      type: DataTypes.FLOAT, // Using FLOAT data type for cost_price.
      allowNull: true, // Now it allows null values.
      defaultValue: null, // Default value is null.
    },
    sale_price: {
      type: DataTypes.FLOAT, // Using FLOAT data type for sale_price.
      allowNull: true, // Now it allows null values.
      defaultValue: null, // Default value is null.
    },
  },
  {
    sequelize,
    timestamps: true,
  }
);

module.exports = ColorSize;
