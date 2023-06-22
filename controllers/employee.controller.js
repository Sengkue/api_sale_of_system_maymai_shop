const Employee = require('../models/employee.model');

// Create a new employee
exports.create = (req, res) => {
  Employee.create({ ...req.body })
    .then((data) => {
      return res.status(200).json({ result: data });
    })
    .catch((error) => {
      return res.status(500).json({ result: error });
    });
};

// Get all employees
exports.findAll = (req, res) => {
  Employee.findAll()
    .then((data) => {
      return res.status(200).json({ result: data });
    })
    .catch((error) => {
      return res.status(500).json({ result: error });
    });
};

// Get a single employee by ID
exports.findOne = (req, res) => {
  const id = req.params.id;
  Employee.findOne({ where: { id: id } })
    .then((data) => {
      return res.status(200).json({ result: data });
    })
    .catch((error) => {
      return res.status(500).json({ result: error });
    });
};

// Update an employee by ID
exports.update = (req, res) => {
  const id = req.params.id;
  const updatedEmployee = { ...req.body };
  Employee.update(updatedEmployee, { where: { id: id } })
    .then((data) => {
      return res.status(200).json({ result: data });
    })
    .catch((error) => {
      return res.status(500).json({ result: error });
    });
};

// Delete an employee by ID
exports.delete = (req, res) => {
  const id = req.params.id;
  Employee.destroy({ where: { id: id } })
    .then((data) => {
      return res.status(200).json({ result: data });
    })
    .catch((error) => {
      return res.status(500).json({ result: error });
    });
};
