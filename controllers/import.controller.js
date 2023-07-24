const Import = require("../models/import.model");
const Employee = require("../models/employee.model");

exports.getAllImports = (req, res) => {
  Import.findAll({
    include: [{ model: Employee, as: 'employee', attributes: ['firstName'] }],
    order: [['createdAt', 'DESC']] // Order by createdAt column in descending order
  })
    .then((imports) => {
      const formattedImports = imports.map((importData) => ({
        id: importData.id,
        receive_date: importData.receive_date,
        employee_id: importData.employee_id,
        createdAt: importData.createdAt,
        updatedAt: importData.updatedAt,
        employeefirstName: importData.employee ? importData.employee.firstName : null
      }));

      res.status(200).json({ result: formattedImports });
    })
    .catch((error) => {
      res.status(500).json({ error: error.message });
    });
};


exports.getImportById = (req, res) => {
  const { id } = req.params;

  Import.findByPk(id, {
    include: [{ model: Employee, as: 'employee', attributes: ['firstName'] }]
  })
    .then((importData) => {
      if (importData) {
        const formattedImport = {
          id: importData.id,
          receive_date: importData.receive_date,
          employee_id: importData.employee_id,
          createdAt: importData.createdAt,
          updatedAt: importData.updatedAt,
          employeefirstName: importData.employee.firstName
        };

        res.status(200).json({ result: formattedImport });
      } else {
        res.status(404).json({ result: "Import not found" });
      }
    })
    .catch((error) => {
      res.status(500).json({ error: error.message });
    });
};

exports.createImport = (req, res) => {
  const { receive_date, employee_id } = req.body; // Add 'employee_id' field

  Import.create({  receive_date, employee_id })
    .then((createdImport) => {
      res.status(201).json({ result: createdImport });
    })
    .catch((error) => {
      res.status(500).json({ error: error.message });
    });
};

exports.updateImport = (req, res) => {
  const { id } = req.params;
  const {  receive_date, employee_id } = req.body; // Add 'employee_id' field

  Import.findByPk(id)
    .then((importData) => {
      if (importData) {
        importData
          .update({ receive_date, employee_id })
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
