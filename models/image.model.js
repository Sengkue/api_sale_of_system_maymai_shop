const { DataTypes } = require("sequelize");
const sequelize = require("../config/db");

const Images = sequelize.define(
  "Images",
  {
    id: {
      type: DataTypes.UUID,
      allowNull: false,
      defaultValue: DataTypes.UUIDV4,
      primaryKey: true,
    },
    productId: {
      type: DataTypes.UUID,
      allowNull: false,
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
    modelName: "Images",
    tableName: "images",
  }
);

module.exports = Images;
