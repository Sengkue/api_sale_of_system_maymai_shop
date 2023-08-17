const Owner = require("../models/owner.model");
const sequelize = require("../config/db");
const { QueryTypes } = require('sequelize');

exports.create = (req, res) => {
    // Check if an owner already exists in the database
    Owner.findOne()
      .then((existingOwner) => {
        if (existingOwner) {
          // An owner already exists, so return an error
          return res.status(400).json({ error: 'Owner already exists' });
        } else {
          // Create a new owner
          Owner.create({ ...req.body })
            .then((data) => {
              return res.status(200).json({ result: data });
            })
            .catch((error) => {
              return res.status(500).json({ error });
            });
        }
      })
      .catch((error) => {
        return res.status(500).json({ error });
      });
  };

exports.findAll = (req, res) => {
  sequelize.query(`SELECT * FROM owners`,
    { type: QueryTypes.SELECT }).then((data) => {
      return res.status(200).json({ result: data });
    })
    .catch((error) => {
      return res.status(500).json({ result: error });
    });
};

exports.findOne = (req, res) => {
  const id = req.params.id;
  Owner.findOne({ where: { id: id } })
    .then((data) => {
      return res.status(200).json({ result: data });
    })
    .catch((error) => {
      return res.status(500).json({ result: error });
    });
};

exports.update = (req, res) => {
  const id = req.params.id;
  const updatedOwner = {
    ...req.body,
  };
  Owner.update(updatedOwner, { where: { id: id } })
    .then((data) => {
      return res.status(200).json({ result: data });
    })
    .catch((error) => {
      return res.status(200).json({ result: error });
    });
};

exports.delete = (req, res) => {
  const id = req.params.id;
  Owner.destroy({ where: { id: id } })
    .then((data) => {
      return res.status(200).json({ result: data });
    })
    .catch((error) => {
      return res.status(500).json({ result: error });
    });
};
