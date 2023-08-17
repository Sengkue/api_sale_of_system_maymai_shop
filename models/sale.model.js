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
      type: DataTypes.STRING,
      allowNull: false,
      primaryKey: true,
      defaultValue: () => {
        const currentDate = new Date();
        const year = currentDate.getFullYear().toString().padStart(4, "0");
        const month = (currentDate.getMonth() + 1).toString().padStart(2, "0");
        const day = currentDate.getDate().toString().padStart(2, "0");
        const hours = currentDate.getHours().toString().padStart(2, "0");
        const minutes = currentDate.getMinutes().toString().padStart(2, "0");
        const seconds = currentDate.getSeconds().toString().padStart(2, "0");
        return `SELL${year}${month}${day}${hours}${minutes}${seconds}`;
      },
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
