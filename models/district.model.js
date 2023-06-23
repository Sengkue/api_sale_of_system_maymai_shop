const { DataTypes } = require('sequelize');
const sequelize = require('../config/db');
const Province = require('./province.model');

const District = sequelize.define(
  'districts',
  {
    id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      autoIncrement: true,
      primaryKey: true,
    },
    provinceId: {
      type: DataTypes.INTEGER,
      allowNull: false,
      references: {
        model: Province,
        key: 'id',
      },
    },
    districtName: {
      type: DataTypes.STRING,
      allowNull: false,
    },
  },
  {
    sequelize,
    timestamps: true,
  }
);

District.belongsTo(Province, { foreignKey: 'provinceId' });

module.exports = District;
