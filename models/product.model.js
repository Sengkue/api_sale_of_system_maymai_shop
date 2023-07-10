const { DataTypes } = require("sequelize");
const sequelize = require("../config/db");
const Category = require("./category.model");
const Supplier = require("./supplier.model");

const Product = sequelize.define(
  "products",
  {
    id: {
      type: DataTypes.UUID,
      allowNull: false,
      defaultValue: DataTypes.UUIDV4,
      primaryKey: true,
    },
    category_id: {
      type: DataTypes.UUID,
      allowNull: true,
    },
    name: {
      type: DataTypes.STRING,
      allowNull: true,
    },
    description: {
      type: DataTypes.STRING,
      allowNull: true,
    },
    sale_price: {
      type: DataTypes.FLOAT,
      allowNull: true,
    },
    cost_price: {
      type: DataTypes.FLOAT,
      allowNull: true,
    },
    Barcode: {
      type: DataTypes.STRING,
      allowNull: true,
    },
    supplier_id: {
      type: DataTypes.UUID,
      allowNull: true,
    },
    profile: {
      type: DataTypes.STRING,
      allowNull: true,
    },
    quantity: {
      type: DataTypes.INTEGER,
      allowNull: true,
      defaultValue: 0,
    },
    size_id: {
      type: DataTypes.STRING,
      allowNull: true,
    },
    color: {
      type: DataTypes.STRING,
      allowNull: true,
    },
  },
  {
    sequelize,
    timestamps: true,
  }
);

Product.belongsTo(Category, { foreignKey: "category_id", as: "category" });
Product.belongsTo(Supplier, { foreignKey: "supplier_id", as: "supplier" });

module.exports = Product;
