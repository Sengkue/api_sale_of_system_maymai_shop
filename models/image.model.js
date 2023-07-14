const { DataTypes } = require("sequelize");
const sequelize = require("../config/db");
const Product = require("./product.model");

const Image = sequelize.define(
  "Image",
  {
    id: {
      type: DataTypes.UUID,
      allowNull: false,
      defaultValue: DataTypes.UUIDV4,
      primaryKey: true,
    },
    productId: {
      type: DataTypes.UUID,
      allowNull: true,
    },
    url: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    altText: {
      type: DataTypes.STRING,
      allowNull: true,
    },
  },
  {
    sequelize,
    timestamps: true,
    modelName: "Image",
    tableName: "images",
  }
);

Image.belongsTo(Product, { foreignKey: 'productId' });

module.exports = Image;
