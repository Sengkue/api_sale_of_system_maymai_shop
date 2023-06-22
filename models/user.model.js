const { DataTypes } = require("sequelize");
const sequelize = require("../config/db");

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
      type: DataTypes.STRING,
      allowNull: true,
    },
    owner_id: {
      type: DataTypes.STRING,
      allowNull: true,
    },
    phone: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    password: {
      type: DataTypes.STRING,
      allowNull: false, // Disallow null values
    },
    status: {
      type: DataTypes.STRING, // Adjust the data type as per your requirements
      allowNull: false,
      // defaultValue: "active", // Set a default value if needed
    },
  },
  {
    sequelize,
    timestamps: true,
  }
);

module.exports = User;
