const { DataTypes } = require("sequelize");
const sequelize = require("../config/db");

const ImportDetail = sequelize.define(
  "ImportDetail",
  {
    id: {
      type: DataTypes.UUID,
      allowNull: false,
      defaultValue: DataTypes.UUIDV4,
      primaryKey: true,
    },
    product_id: {
      type: DataTypes.UUID,
      allowNull: false,
    },
    import_id: {
      type: DataTypes.UUID,
      allowNull: false,
    },
    Imp_price: {
      type: DataTypes.FLOAT,
      allowNull: false,
    },
    Imp_quantity: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
  },
  {
    sequelize,
    tableName: "import_details",
    timestamps: false,
  }
);

module.exports = ImportDetail;
