const { DataTypes } = require("sequelize");
const sequelize = require("../config/db");
const Product = require("./product.model");

const SaleDetail = sequelize.define(
  "sale_details",
  {
    id: {
      type: DataTypes.UUID,
      allowNull: false,
      defaultValue: DataTypes.UUIDV4,
      primaryKey: true,
    },
    sale_id: {
      type: DataTypes.UUID,
      allowNull: false,
    },
    product_id: {
      type: DataTypes.UUID,
      allowNull: false,
    },
    sale_price: {
      type: DataTypes.FLOAT,
      allowNull: false,
    },
    quantity: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    name: { // Include the 'name' attribute from the associated Product model
      type: DataTypes.STRING,
      allowNull: true,
    },
    category: { // Include the 'category' attribute from the associated Product model
      type: DataTypes.UUID,
      allowNull: true,
    },
  },
  {
    sequelize,
    timestamps: true,
  }
);

SaleDetail.belongsTo(Product, { foreignKey: "product_id" }); // Establish the association

module.exports = SaleDetail;
