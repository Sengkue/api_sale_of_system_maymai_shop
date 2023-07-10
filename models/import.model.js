const { DataTypes } = require("sequelize");
const sequelize = require("../config/db");
const Employee = require("./employee.model");

const Import = sequelize.define(
  "imports",
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
        return `IMPORT${year}${month}${day}${hours}${minutes}${seconds}`;
      },
    },
    receive_date: {
      type: DataTypes.DATE,
      allowNull: false,
    },
    employee_id: {
      type: DataTypes.UUID,
      allowNull: true, // Change the allowNull to true if the employee_id can be optional
    },
  },
  {
    sequelize,
    timestamps: true,
  }
);

Import.belongsTo(Employee, { foreignKey: "employee_id", as: "employee" });

module.exports = Import;
