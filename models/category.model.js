const DataTypes = require("sequelize");
const sequelize = require("../config/db");

const Category = sequelize.define(
  "categories",
  {
    // Model attributes are defined here
    id: {
      type: DataTypes.UUID,
      allowNull: false,
      primaryKey: true,
      defaultValue: DataTypes.UUIDV4,
    },
    category: {
      type: DataTypes.STRING,
      // allowNull defaults to true
      allowNull: true,
    },
  },
  {
    sequelize,
    timestamps: true,
  }
);

module.exports = Category;
