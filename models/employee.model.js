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
      allowNull: true,
    },
    lastName: {
      type: DataTypes.STRING,
      allowNull: true,
    },
    gender: {
      type: DataTypes.STRING,
      allowNull: true,
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
    village: {
      type: DataTypes.STRING,
      allowNull: true,
    },
    provinceId: {
      type: DataTypes.INTEGER,
      allowNull: true,
      references: {
        model: Province,
        key: "id",
      },
    },
    districtId: {
      type: DataTypes.INTEGER,
      allowNull: true,
      references: {
        model: District,
        key: "id",
      },
    },
  },
  {
    sequelize,
    timestamps: true,
  }
);

// Define associations
Employee.belongsTo(Province, { foreignKey: 'provinceId', allowNull: true });
Employee.belongsTo(District, { foreignKey: 'districtId', allowNull: true });

module.exports = Employee;
