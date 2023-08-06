const Import = require("../models/import.model");
const Employee = require("../models/employee.model");
const { Op } = require("sequelize");
// ______________________select import by start date and end date
exports.getImportsByDateRange = (req, res) => {
  const { startDate, endDate } = req.query;

  Import.findAll({
    where: {
      receive_date: {
        [Op.between]: [startDate, endDate],
      },
    },
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
// ___________________________________select by all import_________
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
        price: importData.total_price,
        quantity: importData.total_quantity,
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
// ______________________select import data by start date and end date
exports.getAllByDate = (req, res) => {
  const { startDate, endDate } = req.query;

  // Parse the startDate and endDate strings into JavaScript Date objects
  const startOfDay = new Date(startDate);
  startOfDay.setHours(0, 0, 0, 0); // Set the time to the start of the day

  const endOfDay = new Date(endDate);
  endOfDay.setHours(23, 59, 59, 999); // Set the time to the end of the day

  Import.findAll({
    include: [
      {
        model: Employee,
        as: "employee",
        attributes: ["firstName"],
      },
    ],
    where: {
      createdAt: {
        [Op.between]: [startOfDay, endOfDay],
      },
    },
    order: [["createdAt", "DESC"]], // Order by createdAt column in descending order
  })
    .then((imports) => {
      const formattedImports = imports.map((importData) => ({
        id: importData.id,
        receive_date: importData.receive_date,
        employee_id: importData.employee_id,
        price: importData.total_price,
        quantity: importData.total_quantity,
        createdAt: importData.createdAt,
        updatedAt: importData.updatedAt,
        employeefirstName: importData.employee ? importData.employee.firstName : null,
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
  const { receive_date, employee_id, total_price, total_quantity } = req.body; // Add 'employee_id' field

  Import.create({  receive_date, employee_id, total_price, total_quantity })
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
