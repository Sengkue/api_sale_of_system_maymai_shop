const { DataTypes } = require("sequelize");
const sequelize = require("../config/db");

const Customer = sequelize.define(
  "customers",
  {
    c_id: {
      type: DataTypes.UUID,
      allowNull: false,
      defaultValue: DataTypes.UUIDV4,
      primaryKey: true,
    },
    c_profile: {
      type: DataTypes.STRING,
      allowNull: true,
    },
    c_fname: {
      type: DataTypes.STRING,
      allowNull: true,
    },
    c_lname: {
      type: DataTypes.STRING,
      allowNull: true,
    },
    c_gender: {
      type: DataTypes.STRING,
      allowNull: true,
    },
    c_phone: {
      type: DataTypes.STRING,
      allowNull: true,
    },
    c_password: {
      type: DataTypes.STRING,
      allowNull: true,
    },
  },
  {
    sequelize,
    timestamps: true,
  }
);

module.exports = Customer;
