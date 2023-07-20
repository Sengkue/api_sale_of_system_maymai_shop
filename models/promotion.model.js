const { DataTypes } = require('sequelize');
const sequelize = require('../config/db');

const Promotion = sequelize.define(
  'Promotion',
  {
    id: {
      type: DataTypes.UUID,
      defaultValue: DataTypes.UUIDV4,
      primaryKey: true,
    },
    name: {
      type: DataTypes.STRING,
      allowNull: true,
    },
    condition: {
      type: DataTypes.STRING,
      allowNull: true,
    },
    discount: {
      type: DataTypes.FLOAT,
      allowNull: true,
    },
  },
  {
    sequelize,
    timestamps: true,
    modelName: 'Promotion',
    tableName: 'promotions',
  }
);

module.exports = Promotion;
