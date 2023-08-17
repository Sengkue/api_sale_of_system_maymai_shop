// const Size = require("../models/size.model");

// exports.create = (req, res) => {
//   Size.create({ ...req.body })
//     .then((data) => {
//       return res.status(200).json({ result: data });
//     })
//     .catch((error) => {
//       return res.status(500).json({ result: error });
//     });
// };

// exports.findAll = (req, res) => {
//   Size.findAll()
//     .then((data) => {
//       return res.status(200).json({ result: data });
//     })
//     .catch((error) => {
//       return res.status(500).json({ result: error });
//     });
// };

// exports.findOne = (req, res) => {
//   const id = req.params.id;
//   Size.findByPk(id)
//     .then((data) => {
//       if (!data) {
//         return res.status(404).json({ result: 'Size not found' });
//       }
//       return res.status(200).json({ result: data });
//     })
//     .catch((error) => {
//       return res.status(500).json({ result: error });
//     });
// };

// exports.update = (req, res) => {
//   const id = req.params.id;
//   const updatedSize = { ...req.body };

//   Size.update(updatedSize, { where: { id: id } })
//     .then((result) => {
//       if (result[0] === 1) {
//         // Size updated successfully
//         return res.status(200).json({ result: "Size updated successfully" });
//       } else {
//         // Size not found
//         return res.status(404).json({ result: "Size not found" });
//       }
//     })
//     .catch((error) => {
//       return res.status(500).json({ result: error });
//     });
// };

// exports.delete = (req, res) => {
//   const id = req.params.id;
//   Size.destroy({ where: { id: id } })
//     .then((data) => {
//       return res.status(200).json({ result: data });
//     })
//     .catch((error) => {
//       return res.status(500).json({ result: error });
//     });
// };

// exports.deleteAll = async (req, res) => {
//   try {
//     const deletedCount = await Size.destroy({ where: {} });
//     return res.status(200).json({ result: `Deleted ${deletedCount} sizes successfully` });
//   } catch (error) {
//     return res.status(500).json({ result: error });
//   }
// };
