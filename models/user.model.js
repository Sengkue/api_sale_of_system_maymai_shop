const { DataTypes } = require("sequelize");
const sequelize = require("../config/db");
const Employee = require("./employee.model");
const Owner = require("./owner.model");

const User = sequelize.define(
  "users",
  {
    id: {
      type: DataTypes.UUID,
      allowNull: false,
      defaultValue: DataTypes.UUIDV4,
      primaryKey: true,
    },
    employee_id: {
      type: DataTypes.UUID,
      allowNull: true,
    },
    owner_id: {
      type: DataTypes.UUID,
      allowNull: true,
    },
    phone: {
      type: DataTypes.STRING,
      allowNull: true,
    },
    password: {
      type: DataTypes.STRING,
      allowNull: true,
    },
    status: {
      type: DataTypes.STRING,
      allowNull: true,
    },
  },
  {
    sequelize,
    timestamps: true,
  }
);

User.belongsTo(Employee, { foreignKey: "employee_id", as: "employee", onDelete: 'SET NULL', onUpdate: 'CASCADE' });
User.belongsTo(Owner, { foreignKey: "owner_id", as: "owner", onDelete: 'SET NULL', onUpdate: 'CASCADE' });

module.exports = User;
