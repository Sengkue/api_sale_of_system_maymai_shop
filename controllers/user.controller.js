const User = require('../models/user.model');
const Employee = require('../models/employee.model');
const Owner = require('../models/owner.model');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
require('dotenv').config();

exports.create = async (req, res) => {
  try {
    const { employee_id, owner_id, phone, password, status } = req.body;

    // Check if a user with the same phone number already exists
    const existingUser = await User.findOne({ where: { phone: phone } });
    if (existingUser) {
      return res.status(400).json({ result: 'User with the same phone number already exists!' });
    }

    const hashedPassword = await bcrypt.hash(password, 5);

    const user = {
      employee_id,
      owner_id,
      phone,
      password: hashedPassword,
      status: status // Set the desired status value
    };

    const createdUser = await User.create(user);
    return res.status(200).json({ result: createdUser });
  } catch (error) {
    console.error(error);
    return res.status(500).json({ result: 'Internal server error!' });
  }
};

exports.login = async (req, res) => {
  const { phone, password } = req.body;

  try {
    const user = await User.findOne({ 
      where: { phone: phone },
      include: [
        { model: Employee, as: 'employee', attributes: ['firstName'] },
        { model: Owner, as: 'owner', attributes: ['firstName'] }
      ]
    });

    if (user) {
      const validPassword = await bcrypt.compare(password, user.password);
      if (validPassword) {
        const token = jwt.sign({ id: user.id, phone: user.phone }, process.env.SECRET_KEY, { expiresIn: '31d' });

        // Extract first names from employee and owner if available
        const employeeFirstName = user.employee ? user.employee.firstName : null;
        const ownerFirstName = user.owner ? user.owner.firstName : null;

        return res.status(200).json({ 
          result: 'Login successful!', 
          token: token, 
          status: user.status,
          employeeFirstName: employeeFirstName,
          ownerFirstName: ownerFirstName
        });
      }
    }

    return res.status(403).json({ result: 'Invalid phone number or password!' });
  } catch (error) {
    console.error(error);
    return res.status(500).json({ result: 'Internal server error!' });
  }
};


exports.findAll = async (req, res) => {
  try {
    const users = await User.findAll({
      include: [
        { model: Employee, as: 'employee' },
        { model: Owner, as: 'owner' }
      ]
    });
    return res.status(200).json({ result: users });
  } catch (error) {
    return res.status(500).json({ result: error });
  }
};


exports.findOne = async (req, res) => {
  const id = req.params.id;

  try {
    const user = await User.findOne({ 
      where: { id: id },
      include: [
        { model: Employee, as: 'employee' },
        { model: Owner, as: 'owner' }
      ]
    });

    if (user) {
      return res.status(200).json({ result: user });
    } else {
      return res.status(404).json({ result: 'User not found!' });
    }
  } catch (error) {
    return res.status(500).json({ result: error });
  }
};




exports.update = async (req, res) => {
  const id = req.params.id;
  const { employee_id, owner_id, password, status } = req.body;

  try {
    const user = await User.findByPk(id);
    if (user) {
      // Prevent updating the phone number
      const { phone } = user;
      user.employee_id = employee_id;
      user.owner_id = owner_id;

      // Only update the password if it is not null
      if (password) {
        user.password = await bcrypt.hash(password, 5);
      }

      user.status = status;
      await user.save();

      return res.status(200).json({ result: user });
    } else {
      return res.status(404).json({ result: 'User not found!' });
    }
  } catch (error) {
    console.error(error);
    return res.status(500).json({ result: 'Internal server error!' });
  }
};


exports.delete = async (req, res) => {
  const id = req.params.id;

  try {
    const deletedUser = await User.destroy({ where: { id: id } });
    return res.status(200).json({ result: deletedUser });
  } catch (error) {
    return res.status(500).json({ result: error });
  }
};
