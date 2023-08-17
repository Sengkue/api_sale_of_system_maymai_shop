const { DataTypes } = require("sequelize");
const sequelize = require("../config/db");
const Province = require("./province.model");
const District = require("./district.model");

const Supplier = sequelize.define(
  "Supplier",
  {
    id: {
      type: DataTypes.UUID,
      defaultValue: DataTypes.UUIDV4,
      primaryKey: true,
    },
    profile: {
      type: DataTypes.STRING,
    },
    name: {
      type: DataTypes.STRING,
      allowNull: true,
    },
    phone: {
      type: DataTypes.STRING,
    },
    provinceId: {
      type: DataTypes.INTEGER,
      allowNull: true,
    },
    districtId: {
      type: DataTypes.INTEGER,
      allowNull: true,
    },
    village: { // Add the village field
      type: DataTypes.STRING,
      allowNull: true,
    },
    address: {
      type: DataTypes.STRING,
      allowNull: true,
    },
    village: {
      type: DataTypes.STRING,
      allowNull: true,
    },
    description: {
      type: DataTypes.STRING,
    },
    createdAt: {
      type: DataTypes.DATE,
      allowNull: true,
    },
    updatedAt: {
      type: DataTypes.DATE,
      allowNull: true,
    },
  },
  {
    tableName: "Suppliers",
  }
);

Supplier.belongsTo(Province, { foreignKey: "provinceId", targetKey: "id", as: "province" });
Supplier.belongsTo(District, { foreignKey: "districtId", targetKey: "id", as: "district" });

module.exports = Supplier;
