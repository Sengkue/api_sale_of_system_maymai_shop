const DataTypes = require("sequelize");
const sequelize = require("../config/db");
const Product = sequelize.define(
  "products",
  {
    id: {
      type: DataTypes.UUID,
      allowNull: false,
      defaultValue: DataTypes.UUIDV4,
      primaryKey: true,
    },
    name: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    category: {
      type: DataTypes.UUID,
      allowNull: false,
    },
    description: {
      type: DataTypes.STRING,
      allowNull: true,
    },
    sale_price: { // Add the 'sale_price' column
      type: DataTypes.FLOAT, // Modify the data type as per your requirements
      allowNull: false,
    },
    cost_price: { // Add the 'cost_price' column
      type: DataTypes.FLOAT, // Modify the data type as per your requirements
      allowNull: false,
    },
    Barcode: { // Add the 'Barcode' column
      type: DataTypes.STRING, // Modify the data type as per your requirements
      allowNull: true,
    },
    supplier_id: { // Add the 'supplier_id' column
      type: DataTypes.STRING, // Modify the data type as per your requirements
      allowNull: true,
    },
    profile: { // Add the 'profile' column
      type: DataTypes.STRING, // Modify the data type as per your requirements
      allowNull: true,
    },
    quantity: { // Add the 'quantity' column
      type: DataTypes.INTEGER, // Modify the data type as per your requirements
      allowNull: false,
      defaultValue: 0,
    },
    size_id: { // Add the 'quantity' column
      type: DataTypes.INTEGER, // Modify the data type as per your requirements
      allowNull: true,
      defaultValue: 0,
    },
  },
  {
    sequelize,
    timestamps: true,
  }
);

module.exports = Product;
