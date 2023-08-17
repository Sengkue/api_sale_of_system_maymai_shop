const { DataTypes } = require("sequelize");
const sequelize = require("../config/db");
const Import = require("./import.model");
const Product = require("./product.model");

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
      allowNull: true,
    },
    import_id: {
      type: DataTypes.STRING,
      allowNull: true,
    },
    Imp_price: {
      type: DataTypes.INTEGER,
      allowNull: true,
    },
    Imp_quantity: {
      type: DataTypes.INTEGER,
      allowNull: true,
    },
  },
  {
    sequelize,
    tableName: "import_details",
    timestamps: true,
  }
);

ImportDetail.belongsTo(Import, { foreignKey: "import_id", onDelete: "CASCADE", onUpdate: "CASCADE" });
ImportDetail.belongsTo(Product, { foreignKey: "product_id", as: "product", onDelete: "CASCADE", onUpdate: "CASCADE" });

module.exports = ImportDetail;
