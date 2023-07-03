const { DataTypes } = require("sequelize");
const sequelize = require("../config/db");

const Sale = sequelize.define(
  "Sale",
  {
    id: {
      type: DataTypes.UUID,
      allowNull: false,
      defaultValue: DataTypes.UUIDV4,
      primaryKey: true,
    },
    customer_id: {
      type: DataTypes.UUID,
      allowNull: false,
    },
    promotion_id: {
      type: DataTypes.UUID,
      allowNull: true,
    },
    employee_id: {
      type: DataTypes.UUID,
      allowNull: false,
    },
    sale_date: {
      type: DataTypes.DATE,
      allowNull: false,
    },
    sale_total: {
      type: DataTypes.FLOAT,
      allowNull: false,
    },
    sale_type: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    sale_status: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    sale_quantity: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
  },
  {
    sequelize,
    timestamps: true,
    modelName: 'Sale',
    tableName: 'sales'
  }
);

module.exports = Sale;
