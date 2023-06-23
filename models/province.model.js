const { DataTypes } = require("sequelize");
const sequelize = require("../config/db");

const Province = sequelize.define(
  "Province",
  {
    id: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true,
    },
    provinceName: {
      type: DataTypes.STRING,
      allowNull: false,
    },
  },
  {
    timestamps: false,
    tableName: "provinces",
  }
);

module.exports = Province;
