const Supplier = require('../models/supplier.model');

// Get all suppliers
exports.getAllSuppliers = async (req, res) => {
  try {
    const suppliers = await Supplier.findAll();
    res.json(suppliers);
  } catch (error) {
    res.status(500).json({ error: 'Internal server error' });
  }
};

// Get a single supplier by ID
exports.getSupplierById = async (req, res) => {
  const { id } = req.params;
  try {
    const supplier = await Supplier.findByPk(id);
    if (!supplier) {
      return res.status(404).json({ error: 'Supplier not found' });
    }
    res.json(supplier);
  } catch (error) {
    res.status(500).json({ error: 'Internal server error' });
  }
};

// Create a new supplier
exports.createSupplier = async (req, res) => {
  const { profile, name, phone, provinceId, districtId, address, description } = req.body;
  try {
    const supplier = await Supplier.create({
      profile,
      name,
      phone,
      provinceId,
      districtId,
      address,
      description,
    });
    res.status(201).json(supplier);
  } catch (error) {
    res.status(500).json({ error: 'Internal server error' });
  }
};

// Update a supplier by ID
exports.updateSupplier = async (req, res) => {
  const { id } = req.params;
  const { profile, name, phone, provinceId, districtId, address, description } = req.body;
  try {
    const supplier = await Supplier.findByPk(id);
    if (!supplier) {
      return res.status(404).json({ error: 'Supplier not found' });
    }
    supplier.profile = profile;
    supplier.name = name;
    supplier.phone = phone;
    supplier.provinceId = provinceId;
    supplier.districtId = districtId;
    supplier.address = address;
    supplier.description = description;
    await supplier.save();
    res.json(supplier);
  } catch (error) {
    res.status(500).json({ error: 'Internal server error' });
  }
};

// Delete a supplier by ID
exports.deleteSupplier = async (req, res) => {
  const { id } = req.params;
  try {
    const supplier = await Supplier.findByPk(id);
    if (!supplier) {
      return res.status(404).json({ error: 'Supplier not found' });
    }
    await supplier.destroy();
    res.json({ message: 'Supplier deleted successfully' });
  } catch (error) {
    res.status(500).json({ error: 'Internal server error' });
  }
};
