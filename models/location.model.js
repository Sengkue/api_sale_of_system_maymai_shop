const { DataTypes } = require("sequelize");
const sequelize = require("../config/db");
const Customer = require("./customer.model");

const Location = sequelize.define(
  "Location",
  {
    id: {
      type: DataTypes.UUID,
      allowNull: false,
      defaultValue: DataTypes.UUIDV4,
      primaryKey: true,
    },
    province: {
      type: DataTypes.STRING,
      allowNull: true,
    },
    district: {
      type: DataTypes.STRING,
      allowNull: true,
    },
    village: {
      type: DataTypes.STRING,
      allowNull: true,
    },
    address: {
      type: DataTypes.STRING,
      allowNull: true,
    },
    express: {
      type: DataTypes.STRING,
      allowNull: true,
    },
    recipient: {
      type: DataTypes.STRING,
      allowNull: true,
    },
    phone: {
      type: DataTypes.INTEGER, // Change the data type to INTEGER
      allowNull: true,
    },
    customer_id: {
      type: DataTypes.UUID,
      allowNull: true,
      defaultValue: null,
    },
  },
  {
    sequelize,
    timestamps: true,
    modelName: "Location",
    tableName: "locations",
  }
);

// Define the association
Location.belongsTo(Customer, { foreignKey: "customer_id" });

module.exports = Location;
