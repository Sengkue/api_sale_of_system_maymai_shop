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
      allowNull: false,
    },
    condition: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    discount: {
      type: DataTypes.FLOAT,
      allowNull: false,
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
