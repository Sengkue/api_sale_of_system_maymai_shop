const Customer = require('../models/customer.model');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
require('dotenv').config();

exports.create = async (req, res) => {
  try {
    const { c_profile, c_fname, c_lname, c_gender, c_phone, c_password, c_location_id } = req.body;

    if (!c_password) {
      return res.status(400).json({ result: 'Password is required!' });
    }

    const hashedPassword = await bcrypt.hash(c_password, 5);

    const customer = {
      c_profile,
      c_fname,
      c_lname,
      c_gender,
      c_phone,
      c_password: hashedPassword,
      c_location_id,
    };

    const createdCustomer = await Customer.create(customer);
    return res.status(200).json({ result: createdCustomer });
  } catch (error) {
    console.error(error);
    return res.status(500).json({ result: 'Internal server error!' });
  }
};

exports.login = async (req, res) => {
    const { c_phone, c_password } = req.body;
  
    try {
      const customer = await Customer.findOne({ where: { c_phone } });
      if (customer) {
        const validPassword = await bcrypt.compare(c_password, customer.c_password);
        if (validPassword) {
          const payload = {
            id: customer.c_id,
            c_phone: customer.c_phone,
            c_fname: customer.c_fname // Include c_fname in the payload
          };
  
          const token = jwt.sign(payload, process.env.SECRET_KEY, { expiresIn: '31d' });
          return res.status(200).json({ result: 'Login successful!', token, c_fname: customer.c_fname });
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
    const customers = await Customer.findAndCountAll();
    return res.status(200).json({ result: customers });
  } catch (error) {
    return res.status(500).json({ result: error });
  }
};

exports.findOne = async (req, res) => {
  const id = req.params.id;

  try {
    const customer = await Customer.findOne({ where: { c_id: id } });
    if (customer) {
      return res.status(200).json({ result: customer });
    } else {
      return res.status(404).json({ result: 'Customer not found!' });
    }
  } catch (error) {
    return res.status(500).json({ result: error });
  }
};
// update customer information
exports.update = async (req, res) => {
  const id = req.params.id;
  const { c_profile, c_fname, c_lname, c_gender,c_location_id } = req.body;

  try {
    const updatedCustomer = await Customer.update(
      { c_profile, c_fname, c_lname, c_gender, c_location_id },
      { where: { c_id: id } }
    );
    return res.status(200).json({ result: updatedCustomer });
  } catch (error) {
    return res.status(500).json({ result: error });
  }
};
// udate custommer pssword
exports.update_password = async (req, res) => {
  const id = req.params.id;
  const { c_password } = req.body;

  try {
    // Hash the new password
    const hashedPassword = await bcrypt.hash(c_password, 5);

    // Update the password field
    await Customer.update(
      { c_password: hashedPassword },
      { where: { c_id: id } }
    );

    return res.status(200).json({ result: 'Password updated successfully!' });
  } catch (error) {
    return res.status(500).json({ result: error });
  }
};

exports.delete = async (req, res) => {
  const id = req.params.id;

  try {
    const deletedCustomer = await Customer.destroy({ where: { c_id: id } });
    return res.status(200).json({ result: deletedCustomer });
  } catch (error) {
    return res.status(500).json({ result: error });
  }
};
