const Banner = require('../models/banner.model');
const sequelize = require('../config/db');

exports.create = (req, res) => {
    Banner.create({ ...req.body })
      .then((data) => {
        return res.status(200).json({ result: data });
      })
      .catch((error) => {
        return res.status(500).json({ result: error });
      });
  };
  

exports.findAll = (req, res) => {
  Banner.findAll()
    .then((data) => {
      return res.status(200).json({ result: data });
    })
    .catch((error) => {
      return res.status(500).json({ result: error });
    });
};

exports.findOne = (req, res) => {
  const id = req.params.id;
  Banner.findOne({ where: { id: id } })
    .then((data) => {
      return res.status(200).json({ result: data });
    })
    .catch((error) => {
      return res.status(500).json({ result: error });
    });
};

exports.update = (req, res) => {
  const id = req.params.id;
  const updatedBanner = { ...req.body };

  Banner.update(updatedBanner, { where: { id: id } })
    .then((data) => {
      return res.status(200).json({ result: data });
    })
    .catch((error) => {
      return res.status(500).json({ result: error });
    });
};

exports.delete = (req, res) => {
  const id = req.params.id;
  Banner.destroy({ where: { id: id } })
    .then((data) => {
      return res.status(200).json({ result: data });
    })
    .catch((error) => {
      return res.status(500).json({ result: error });
    });
};
