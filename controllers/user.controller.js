const User = require('../models/user.model');
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
    const user = await User.findOne({ where: { phone: phone } });
    if (user) {
      const validPassword = await bcrypt.compare(password, user.password);
      if (validPassword) {
        const token = jwt.sign({ id: user.id, phone: user.phone }, process.env.SECRET_KEY, { expiresIn: '31d' });
        return res.status(200).json({ result: 'Login successful!', token: token, status: user.status });
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
    const users = await User.findAndCountAll();
    return res.status(200).json({ result: users });
  } catch (error) {
    return res.status(500).json({ result: error });
  }
};

exports.findOne = async (req, res) => {
  const id = req.params.id;

  try {
    const user = await User.findOne({ where: { id: id } });
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
      user.password = await bcrypt.hash(password, 5);
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
