const { DataTypes } = require('sequelize');
const sequelize = require('../config/db');
const Product = require('./product.model');
const Sale = require('./sale.model');

const SaleDetail = sequelize.define(
  'SaleDetail',
  {
    id: {
      type: DataTypes.UUID,
      allowNull: false,
      defaultValue: DataTypes.UUIDV4,
      primaryKey: true,
    },
    sale_id: {
      type: DataTypes.UUID,
      allowNull: true,
    },
    color_size_id: {
      type: DataTypes.UUID,
      allowNull: true,
    },
    product_id: {
      type: DataTypes.UUID,
      allowNull: true,
    },
    sale_price: {
      type: DataTypes.FLOAT,
      allowNull: true,
    },
    quantity: {
      type: DataTypes.INTEGER,
      allowNull: true,
    },
    color: {
      type: DataTypes.STRING, // Assuming color is a string, adjust data type if needed
      allowNull: true,
    },
    size: {
      type: DataTypes.STRING, // Assuming size is a string, adjust data type if needed
      allowNull: true,
    },
  },
  {
    sequelize,
    timestamps: true,
    modelName: 'SaleDetail',
    tableName: 'sale_details',
  }
);

SaleDetail.belongsTo(Product, { foreignKey: 'product_id' });
SaleDetail.belongsTo(Sale, { foreignKey: 'sale_id' });

module.exports = SaleDetail;
