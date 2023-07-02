const ImageSlide = require("../models/image_slides.model");

// Create a new image slide
exports.createImageSlide = (req, res) => {
  const { name, image } = req.body;

  ImageSlide.create({ name, image })
    .then((imageSlide) => {
      res.status(201).json({ result: imageSlide });
    })
    .catch((error) => {
      res.status(500).json({ error: "Failed to create image slide" });
    });
};

// Get all image slides
exports.getAllImageSlides = (req, res) => {
  ImageSlide.findAll()
    .then((imageSlides) => {
      res.status(200).json({ result: imageSlides });
    })
    .catch((error) => {
      res.status(500).json({ error: "Failed to retrieve image slides" });
    });
};

// Get a single image slide by ID
exports.getImageSlideById = (req, res) => {
  const id = req.params.id;

  ImageSlide.findByPk(id)
    .then((imageSlide) => {
      if (!imageSlide) {
        res.status(404).json({ result: "Image slide not found" });
      } else {
        res.status(200).json({ result: imageSlide });
      }
    })
    .catch((error) => {
      res.status(500).json({ error: "Failed to retrieve image slide" });
    });
};

// Update an image slide by ID
exports.updateImageSlide = (req, res) => {
  const id = req.params.id;
  const { name, image } = req.body;

  ImageSlide.update({ name, image }, { where: { id } })
    .then((result) => {
      if (result[0] === 0) {
        res.status(404).json({ result: "Image slide not found" });
      } else {
        res.status(200).json({ result: "Image slide updated successfully" });
      }
    })
    .catch((error) => {
      res.status(500).json({ error: "Failed to update image slide" });
    });
};

// Delete an image slide by ID
exports.deleteImageSlide = (req, res) => {
  const id = req.params.id;

  ImageSlide.destroy({ where: { id } })
    .then((result) => {
      if (result === 0) {
        res.status(404).json({ result: "Image slide not found" });
      } else {
        res.status(200).json({ result: "Image slide deleted successfully" });
      }
    })
    .catch((error) => {
      res.status(500).json({ error: "Failed to delete image slide" });
    });
};
