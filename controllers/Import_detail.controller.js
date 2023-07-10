const ImportDetail = require("../models/import_detail.model");
const Product = require("../models/product.model");
const Category = require("../models/category.model");
const Supplier = require("../models/supplier.model");

exports.createImportDetail = (req, res) => {
  const { product_id, import_id, Imp_price, Imp_quantity } = req.body;

  ImportDetail.create({
    product_id,
    import_id,
    Imp_price,
    Imp_quantity,
  })
    .then((importDetail) => {
      res.status(201).json({ result: importDetail });
    })
    .catch((error) => {
      res.status(500).json({ error: error.message });
    });
};

exports.getImportDetail = (req, res) => {
  ImportDetail.findAll()
    .then((importDetails) => {
      res.status(200).json({ result: importDetails });
    })
    .catch((error) => {
      res.status(500).json({ error: error.message });
    });
};

exports.getImportDetailById = (req, res) => {
  const { id } = req.params;

  ImportDetail.findByPk(id)
    .then((importDetail) => {
      if (!importDetail) {
        res.status(404).json({ result: "Import detail not found" });
      } else {
        res.status(200).json({ result: importDetail });
      }
    })
    .catch((error) => {
      res.status(500).json({ error: error.message });
    });
};

exports.updateImportDetail = (req, res) => {
  const { id } = req.params;
  const { product_id, import_id, Imp_price, Imp_quantity } = req.body;

  ImportDetail.findByPk(id)
    .then((importDetail) => {
      if (!importDetail) {
        res.status(404).json({ result: "Import detail not found" });
      } else {
        importDetail
          .update({
            product_id,
            import_id,
            Imp_price,
            Imp_quantity,
          })
          .then((updatedImportDetail) => {
            res.status(200).json({ result: updatedImportDetail });
          });
      }
    })
    .catch((error) => {
      res.status(500).json({ error: error.message });
    });
};

exports.deleteImportDetail = (req, res) => {
  const { id } = req.params;

  ImportDetail.destroy({ where: { id } })
    .then((rowsDeleted) => {
      if (rowsDeleted === 0) {
        res.status(404).json({ result: "Import detail not found" });
      } else {
        res.status(200).json({ result: "Import detail deleted successfully" });
      }
    })
    .catch((error) => {
      res.status(500).json({ error: error.message });
    });
};
exports.getImportDetailsByImportId = (req, res) => {
  const { import_id } = req.params;

  ImportDetail.findAll({
    where: { import_id },
    include: [
      {
        model: Product,
        as: "product",
        attributes: ["name", "profile"],
        include: [
          { model: Category, as: "category", attributes: ["category"] },
          { model: Supplier, as: "supplier", attributes: ["name"] },
        ],
      },
    ],
  })
    .then((importDetails) => {
      // Map the result to the desired structure
      const mappedImportDetails = importDetails.map((importDetail) => ({
        id: importDetail.id,
        product_id: importDetail.product_id,
        import_id: importDetail.import_id,
        Imp_price: importDetail.Imp_price,
        Imp_quantity: importDetail.Imp_quantity,
        createdAt: importDetail.createdAt,
        updatedAt: importDetail.updatedAt,
        productName: importDetail.product.name,
        productProfile: importDetail.product.profile,
        category: importDetail.product.category.category,
        supplierName: importDetail.product.supplier.name,
      }));

      res.status(200).json({ result: mappedImportDetails });
    })
    .catch((error) => {
      res.status(500).json({ error: error.message });
    });
};
