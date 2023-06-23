const Province = require("../models/province.model");

exports.create = (req, res) => {
  Province.create({ provinceName: req.body.provinceName })
    .then((data) => {
      return res.status(200).json({ result: data });
    })
    .catch((error) => {
      return res.status(500).json({ result: error });
    });
};

exports.findAll = (req, res) => {
  Province.findAll()
    .then((data) => {
      return res.status(200).json({ result: data });
    })
    .catch((error) => {
      return res.status(500).json({ result: error });
    });
};

exports.findOne = (req, res) => {
  const id = req.params.id;
  Province.findByPk(id)
    .then((data) => {
      if (data) {
        return res.status(200).json({ result: data });
      } else {
        return res.status(404).json({ result: "Province not found" });
      }
    })
    .catch((error) => {
      return res.status(500).json({ result: error });
    });
};

exports.update = (req, res) => {
  const id = req.params.id;
  const updatedProvince = { provinceName: req.body.provinceName };
  Province.update(updatedProvince, { where: { id: id } })
    .then((data) => {
      if (data[0] === 1) {
        return res.status(200).json({ message: "Province updated successfully" });
      } else {
        return res.status(404).json({ result: "Province not found" });
      }
    })
    .catch((error) => {
      return res.status(500).json({ result: error });
    });
};

exports.delete = (req, res) => {
  const id = req.params.id;
  Province.destroy({ where: { id: id } })
    .then((data) => {
      if (data === 1) {
        return res.status(200).json({ message: "Province deleted successfully" });
      } else {
        return res.status(404).json({ result: "Province not found" });
      }
    })
    .catch((error) => {
      return res.status(500).json({ result: error });
    });
};

exports.deleteAll = async (req, res) => {
    try {
      await Province.destroy({ where: {} });
      return res.status(200).json({ message: 'All provinces deleted successfully' });
    } catch (error) {
      return res.status(500).json({ error: 'An error occurred while deleting provinces' });
    }
  };
