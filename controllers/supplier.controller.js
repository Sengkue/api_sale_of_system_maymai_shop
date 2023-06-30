const Supplier = require('../models/supplier.model');
const Province = require('../models/province.model'); // Import the Province model
const District = require('../models/district.model'); // Import the District model
// Get all suppliers
exports.getAllSuppliers = async (req, res) => {
  try {
    const suppliers = await Supplier.findAll({
      include: [
        { model: Province, as: 'province' },
        { model: District, as: 'district' }
      ]
    });

    // Map the suppliers array and format the response
    const formattedSuppliers = suppliers.map((supplier) => ({
      id: supplier.id,
      profile: supplier.profile,
      name: supplier.name,
      phone: supplier.phone,
      provinceId: supplier.provinceId,
      districtId: supplier.districtId,
      village: supplier.village,
      address: supplier.address,
      description: supplier.description,
      createdAt: supplier.createdAt,
      updatedAt: supplier.updatedAt,
      province: supplier.province.provinceName, // Extract the province name
      district: supplier.district.districtName // Extract the district name
    }));

    res.json(formattedSuppliers);
  } catch (error) {
    res.status(500).json({ error: 'Internal server error' });
  }
};

// Get a single supplier by ID
exports.getSupplierById = async (req, res) => {
  const { id } = req.params;
  try {
    const supplier = await Supplier.findByPk(id, {
      include: [
        { model: Province, as: 'province' },
        { model: District, as: 'district' }
      ]
    });
    if (!supplier) {
      return res.status(404).json({ error: 'Supplier not found' });
    }

    // Format the response
    const formattedSupplier = {
      id: supplier.id,
      profile: supplier.profile,
      name: supplier.name,
      phone: supplier.phone,
      provinceId: supplier.provinceId,
      districtId: supplier.districtId,
      village: supplier.village,
      address: supplier.address,
      description: supplier.description,
      createdAt: supplier.createdAt,
      updatedAt: supplier.updatedAt,
      province: supplier.province.provinceName, // Extract the province name
      district: supplier.district.districtName // Extract the district name
    };

    res.json(formattedSupplier);
  } catch (error) {
    res.status(500).json({ error: 'Internal server error' });
  }
};


// Create a new supplier
exports.createSupplier = async (req, res) => {
  const { profile, name, phone, provinceId, districtId, village, address, description } = req.body;
  try {
    const supplier = await Supplier.create({
      profile,
      name,
      phone,
      provinceId,
      districtId,
      village,
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
  const { profile, name, phone, provinceId, districtId, village, address, description } = req.body;
  try {
    const supplier = await Supplier.findByPk(id);
    if (!supplier) {
      return res.status(404).json({ error: 'Supplier not found' });
    }
    supplier.profile = profile;
    supplier.name = name;
    supplier.phone = phone;
    // supplier.village = village;
    supplier.provinceId = provinceId;
    supplier.districtId = districtId;
    supplier.village = village; // Include the village field
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
