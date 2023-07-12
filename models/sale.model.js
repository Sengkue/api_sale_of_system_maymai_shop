const { DataTypes } = require('sequelize');
const sequelize = require('../config/db');
const Promotion = require('./promotion.model');
const Customer = require('./customer.model');
const Employee = require('./employee.model');
const Location = require('./location.model');

const Sale = sequelize.define(
  'Sale',
  {
    id: {
      type: DataTypes.UUID,
      allowNull: false,
      defaultValue: DataTypes.UUIDV4,
      primaryKey: true,
    },
    customer_id: {
      type: DataTypes.UUID,
      allowNull: true,
      defaultValue: null,
    },
    promotion_id: {
      type: DataTypes.UUID,
      allowNull: true,
      defaultValue: null,
    },
    employee_id: {
      type: DataTypes.UUID,
      allowNull: true,
      defaultValue: null,
    },
    location_id: {
      type: DataTypes.UUID,
      allowNull: true,
      defaultValue: null,
    },
    payment: {
      type: DataTypes.STRING,
      allowNull: true,
    },
    sale_date: {
      type: DataTypes.DATE,
      allowNull: true,
    },
    sale_total: {
      type: DataTypes.FLOAT,
      allowNull: true,
    },
    sale_type: {
      type: DataTypes.STRING,
      allowNull: true,
    },
    sale_status: {
      type: DataTypes.STRING,
      allowNull: true,
    },
    sale_quantity: {
      type: DataTypes.INTEGER,
      allowNull: true,
    },
  },
  {
    sequelize,
    timestamps: true,
    modelName: 'Sale',
    tableName: 'sales',
  }
);

Sale.belongsTo(Promotion, {
  foreignKey: 'promotion_id',
  as: 'promotion',
  allowNull: true,
});

Sale.belongsTo(Customer, {
  foreignKey: 'customer_id',
  as: 'customer',
  allowNull: true,
});

Sale.belongsTo(Employee, {
  foreignKey: 'employee_id',
  as: 'employee',
  allowNull: true,
});

Sale.belongsTo(Location, {
  foreignKey: 'location_id',
  as: 'location',
  allowNull: true,
});

module.exports = Sale;
