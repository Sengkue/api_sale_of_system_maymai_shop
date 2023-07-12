const { DataTypes } = require('sequelize');
const sequelize = require('../config/db');

const Banner = sequelize.define(
  'Banner',
  {
    id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      autoIncrement: true,
      primaryKey: true,
    },
    ownerId: {
      type: DataTypes.INTEGER,
      allowNull: true,
    },
    url: {
      type: DataTypes.STRING,
      allowNull: true,
    },
  },
  {
    sequelize,
    timestamps: true,
    modelName: 'Banner',
    tableName: 'banners',
  }
);

module.exports = Banner;
