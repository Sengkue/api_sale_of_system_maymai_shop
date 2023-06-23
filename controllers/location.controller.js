const Location = require("../models/location.model");

exports.createLocation = async (req, res) => {
  try {
    const location = await Location.create({ ...req.body });
    return res.status(200).json({ result: location });
  } catch (error) {
    return res.status(500).json({ result: error });
  }
};

exports.getAllLocations = async (req, res) => {
  try {
    const locations = await Location.findAll();
    return res.status(200).json({ result: locations });
  } catch (error) {
    return res.status(500).json({ result: error });
  }
};

exports.getLocationById = async (req, res) => {
    const id = req.params.id;
    try {
      const location = await Location.findOne({ where: { id: id } });
  
      if (!location) {
        return res.status(404).json({ error: 'Location not found' });
      }
  
      return res.status(200).json({ result: location });
    } catch (error) {
      return res.status(500).json({ result: error });
    }
  };
  

exports.updateLocation = async (req, res) => {
    const id = req.params.id;
    const updatedLocation = { ...req.body };
  
    // Validate provinceId
    if (isNaN(updatedLocation.provinceId)) {
      return res.status(400).json({ error: 'provinceId must be a valid integer' });
    }
  
    // Validate districtId
    if (isNaN(updatedLocation.districtId)) {
      return res.status(400).json({ error: 'districtId must be a valid integer' });
    }
  
    try {
      const location = await Location.findOne({ where: { id: id } });
      if (!location) {
        return res.status(404).json({ error: 'Location not found' });
      }
  
      await location.update(updatedLocation);
      return res.status(200).json({ message: 'Location updated successfully' });
    } catch (error) {
      return res.status(500).json({ result: error });
    }
  };
  
  

  exports.deleteLocation = async (req, res) => {
    const id = req.params.id;
    try {
      const deletedRowCount = await Location.destroy({ where: { id: id } });
      if (deletedRowCount === 0) {
        return res.status(404).json({ message: 'Location not found' });
      }
      return res.status(200).json({ message: 'Location deleted successfully' });
    } catch (error) {
      return res.status(500).json({ result: error });
    }
  };
  