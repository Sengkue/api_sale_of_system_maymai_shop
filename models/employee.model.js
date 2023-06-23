const { DataTypes } = require("sequelize");
const sequelize = require("../config/db");
const Province = require("./province.model");
const District = require("./district.model");

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

// Define associations
Employee.belongsTo(Province, { foreignKey: 'provinceId' });
Employee.belongsTo(District, { foreignKey: 'districtId' });

module.exports = Employee;