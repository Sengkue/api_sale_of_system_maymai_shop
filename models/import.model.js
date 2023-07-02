const { DataTypes } = require("sequelize");
const sequelize = require("../config/db");

const Import = sequelize.define(
  "imports",
  {
    id: {
      type: DataTypes.UUID,
      allowNull: false,
      defaultValue: DataTypes.UUIDV4,
      primaryKey: true,
    },
    import_total: {
      type: DataTypes.FLOAT,
      allowNull: false,
    },
    receive_date: {
      type: DataTypes.DATE,
      allowNull: false,
    },
  },
  {
    sequelize,
    timestamps: true,
  }
);

module.exports = Import;
