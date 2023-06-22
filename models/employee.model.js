const { DataTypes } = require("sequelize");
const sequelize = require("../config/db");

const Employee = sequelize.define(
  "employees",
  {
    id: {
      type: DataTypes.UUID,
      allowNull: false,
      defaultValue: DataTypes.UUIDV4,
      primaryKey: true,
    },
    firstName: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    lastName: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    gender: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    address: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    provinceId: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    districtId: { // Updated field name from 'district_id' to 'districtId'
      type: DataTypes.STRING,
      allowNull: false,
    },
    village: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    profile: {
      type: DataTypes.STRING,
      allowNull: true,
    },
    email: {
      type: DataTypes.STRING,
      allowNull: true,
    },
    phone: {
      type: DataTypes.STRING,
      allowNull: true,
    },
  },
  {
    sequelize,
    timestamps: true,
  }
);

module.exports = Employee;
