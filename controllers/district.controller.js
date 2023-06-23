const District = require('../models/district.model');
const Province = require('../models/province.model');

exports.create = (req, res) => {
  const { provinceId, districtName } = req.body;

  Province.findByPk(provinceId)
    .then((province) => {
      if (!province) {
        return res.status(404).json({ message: 'Province not found' });
      }

      return District.create({ provinceId, districtName })
        .then((data) => {
          return res.status(201).json({ result: data });
        })
        .catch((error) => {
          return res.status(500).json({ result: error });
        });
    })
    .catch((error) => {
      return res.status(500).json({ result: error });
    });
};

exports.findAll = (req, res) => {
    District.findAll({
      include: [{ model: Province, attributes: ['provinceName'], as: 'Province' }],
    })
      .then((districts) => {
        const formattedDistricts = districts.map((district) => ({
          id: district.id,
          provinceId: district.provinceId,
          districtName: district.districtName,
          provinceName: district.Province ? district.Province.provinceName : null,
          createdAt: district.createdAt,
          updatedAt: district.updatedAt,
        }));
        return res.status(200).json({ result: formattedDistricts });
      })
      .catch((error) => {
        return res.status(500).json({ result: error });
      });
  };


  exports.findOne = (req, res) => {
    const id = req.params.id;
    District.findOne({
      where: { id: id },
      include: [{ model: Province, attributes: ['provinceName'], as: 'Province' }],
    })
      .then((district) => {
        if (!district) {
          return res.status(404).json({ message: 'District not found' });
        }
        const formattedDistrict = {
          id: district.id,
          provinceId: district.provinceId,
          districtName: district.districtName,
          provinceName: district.Province ? district.Province.provinceName : null,
          createdAt: district.createdAt,
          updatedAt: district.updatedAt,
        };
        return res.status(200).json({ result: formattedDistrict });
      })
      .catch((error) => {
        return res.status(500).json({ result: error });
      });
  };

exports.update = (req, res) => {
  const id = req.params.id;
  const updatedDistrict = { ...req.body };
  District.update(updatedDistrict, { where: { id: id } })
    .then(() => {
      return res.status(200).json({ message: 'District updated successfully' });
    })
    .catch((error) => {
      return res.status(500).json({ result: error });
    });
};

exports.delete = (req, res) => {
    const id = req.params.id;
    District.findByPk(id)
      .then((district) => {
        if (!district) {
          return res.status(404).json({ message: 'District not found' });
        }
        return District.destroy({ where: { id: id } });
      })
      .then(() => {
        return res.status(200).json({ message: 'District deleted successfully' });
      })
      .catch((error) => {
        return res.status(500).json({ result: error });
      });
  };
  
  exports.deleteAll = (req, res) => {
    District.findAll()
      .then((districts) => {
        if (districts.length === 0) {
          return res.status(404).json({ message: 'No districts found' });
        } else {
          return District.destroy({ where: {} });
        }
      })
      .then((deletedCount) => {
        if (deletedCount > 0) {
          return res.status(200).json({ message: 'All districts deleted successfully' });
        } else {
          return res.status(200).json({ message: 'No districts found' });
        }
      })
      .catch((error) => {
        if (!res.headersSent) {
          return res.status(500).json({ result: error });
        }
      });
  };
  
  
  
  
