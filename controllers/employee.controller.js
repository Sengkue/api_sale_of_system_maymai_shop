const Employee = require('../models/employee.model');
const Province = require('../models/province.model');
const District = require('../models/district.model');

exports.create = async (req, res) => {
  try {
    const { firstName, lastName, gender, provinceId, districtId, village, profile, email, phone } = req.body;

    // Check if the specified provinceId and districtId exist
    const province = await Province.findByPk(provinceId);
    const district = await District.findByPk(districtId);

    if (!province || !district) {
      return res.status(404).json({ result: 'Province or district not found!' });
    }

    const employee = {
      firstName,
      lastName,
      gender,
      provinceId,
      districtId,
      village,
      profile,
      email,
      phone,
    };

    const createdEmployee = await Employee.create(employee);
    return res.status(200).json({ result: createdEmployee });
  } catch (error) {
    console.error(error);
    return res.status(500).json({ result: 'Internal server error!' });
  }
};

exports.findAll = async (req, res) => {
  try {
    const employees = await Employee.findAll({
      include: [
        { model: Province },
        { model: District }
      ]
    });

    // Extract only the necessary employee information and associated province and district names
    const formattedEmployees = employees.map(employee => ({
      id: employee.id,
      firstName: employee.firstName,
      lastName: employee.lastName,
      gender: employee.gender,
      profile: employee.profile,
      email: employee.email,
      phone: employee.phone,
      createdAt: employee.createdAt,
      updatedAt: employee.updatedAt,
      provinceId: employee.provinceId,
      districtId: employee.districtId,
      village:employee.village,
      province: employee.Province ? employee.Province.provinceName : null,
      district: employee.district ? employee.district.districtName : null
    }));

    return res.status(200).json({ result: formattedEmployees });
  } catch (error) {
    console.error(error);
    return res.status(500).json({ result: 'Internal server error!' });
  }
};

exports.findOne = async (req, res) => {
  const id = req.params.id;

  try {
    const employee = await Employee.findOne({
      where: { id: id },
      include: [
        { model: Province },
        { model: District }
      ]
    });

    if (!employee) {
      return res.status(404).json({ result: 'Employee not found!' });
    }

    // Extract only the necessary employee information and associated province and district names
    const formattedEmployee = {
      id: employee.id,
      firstName: employee.firstName,
      lastName: employee.lastName,
      gender: employee.gender,
      profile: employee.profile,
      email: employee.email,
      phone: employee.phone,
      village: employee.village,
      createdAt: employee.createdAt,
      updatedAt: employee.updatedAt,
      provinceId: employee.provinceId,
      districtId: employee.districtId,
      province: employee.Province ? employee.Province.provinceName : null,
      district: employee.district ? employee.district.districtName : null
    };

    return res.status(200).json({ result: formattedEmployee });
  } catch (error) {
    console.error(error);
    return res.status(500).json({ result: 'Internal server error!' });
  }
};

exports.update = async (req, res) => {
  const id = req.params.id;
  const updatedEmployee = { ...req.body };

  try {
    const employee = await Employee.findByPk(id);

    if (employee) {
      await Employee.update(updatedEmployee, { where: { id: id } });
      return res.status(200).json({ result: 'Employee updated successfully!' });
    } else {
      return res.status(404).json({ result: 'Employee not found!' });
    }
  } catch (error) {
    console.error(error);
    return res.status(500).json({ result: 'Internal server error!' });
  }
};

exports.delete = async (req, res) => {
  const id = req.params.id;

  try {
    const deletedEmployee = await Employee.destroy({ where: { id: id } });
    return res.status(200).json({ result: 'Employee deleted successfully!' });
  } catch (error) {
    console.error(error);
    return res.status(500).json({ result: 'Internal server error!' });
  }
};
