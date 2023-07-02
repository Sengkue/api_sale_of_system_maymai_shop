const ImportDetail = require("../models/Import_detail.model");

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

