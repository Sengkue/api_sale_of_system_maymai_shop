const Import = require("../models/import.model");

exports.getAllImports = (req, res) => {
  Import.findAll()
    .then((imports) => {
      res.status(200).json({ result: imports });
    })
    .catch((error) => {
      res.status(500).json({ error: error.message });
    });
};

exports.getImportById = (req, res) => {
  const { id } = req.params;

  Import.findByPk(id)
    .then((importData) => {
      if (importData) {
        res.status(200).json({ result: importData });
      } else {
        res.status(404).json({ result: "Import not found" });
      }
    })
    .catch((error) => {
      res.status(500).json({ error: error.message });
    });
};

exports.createImport = (req, res) => {
  const { import_total, receive_date } = req.body;

  Import.create({ import_total, receive_date })
    .then((createdImport) => {
      res.status(201).json({ result: createdImport });
    })
    .catch((error) => {
      res.status(500).json({ error: error.message });
    });
};

exports.updateImport = (req, res) => {
  const { id } = req.params;
  const { import_total, receive_date } = req.body;

  Import.findByPk(id)
    .then((importData) => {
      if (importData) {
        importData
          .update({ import_total, receive_date })
          .then((updatedImport) => {
            res.status(200).json({ result: updatedImport });
          })
          .catch((error) => {
            res.status(500).json({ error: error.message });
          });
      } else {
        res.status(404).json({ result: "Import not found" });
      }
    })
    .catch((error) => {
      res.status(500).json({ error: error.message });
    });
};

exports.deleteImport = (req, res) => {
    const { id } = req.params;
  
    Import.destroy({ where: { id } })
      .then((rowsDeleted) => {
        if (rowsDeleted === 0) {
          // No import was found with the provided ID
          res.status(404).json({ result: "Import not found" });
        } else {
          // Import was successfully deleted
          res.status(200).json({ result: "Import deleted successfully" });
        }
      })
      .catch((error) => {
        // Error occurred while deleting the import
        res.status(500).json({ error: error.message });
      });
  };
