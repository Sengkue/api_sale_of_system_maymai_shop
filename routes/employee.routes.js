const express = require('express');
const router = express.Router();
const employeeController = require('../controllers/employee.controller');
const verifyToken = require('../middleware');

// Create a new employee
router.post('/', employeeController.create);

// Get all employees
router.get('/', verifyToken, employeeController.findAll);

// Get a single employee by ID
router.get('/:id', verifyToken, employeeController.findOne);

// Update an employee by ID
router.put('/:id', employeeController.update);

// Delete an employee by ID
router.delete('/:id', employeeController.delete);

module.exports = router;
