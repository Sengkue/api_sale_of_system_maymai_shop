const Images = require('../models/image.model');

// Create a new image
exports.create = (req, res) => {
  const { productId, url, altText } = req.body;
  Images.create({ productId, url, altText })
    .then((image) => {
      res.status(200).json({ success: true, data: image });
    })
    .catch((error) => {
      res.status(500).json({ success: false, error: error.message });
    });
};

// Get all images
exports.findAll = (req, res) => {
  Images.findAll()
    .then((images) => {
      res.status(200).json({ success: true, data: images });
    })
    .catch((error) => {
      res.status(500).json({ success: false, error: error.message });
    });
};

// Get a single image by ID
exports.findOne = (req, res) => {
  const id = req.params.id;
  Images.findByPk(id)
    .then((image) => {
      if (!image) {
        res.status(404).json({ success: false, error: 'Image not found' });
      } else {
        res.status(200).json({ success: true, data: image });
      }
    })
    .catch((error) => {
      res.status(500).json({ success: false, error: error.message });
    });
};

// Update an image by ID
exports.update = (req, res) => {
  const id = req.params.id;
  const { productId, url, altText } = req.body;
  Images.findByPk(id)
    .then((image) => {
      if (!image) {
        res.status(404).json({ success: false, error: 'Image not found' });
      } else {
        image.productId = productId;
        image.url = url;
        image.altText = altText;
        return image.save();
      }
    })
    .then((updatedImage) => {
      res.status(200).json({ success: true, data: updatedImage });
    })
    .catch((error) => {
      res.status(500).json({ success: false, error: error.message });
    });
};

// Delete an image by ID
exports.delete = (req, res) => {
  const id = req.params.id;
  Images.findByPk(id)
    .then((image) => {
      if (!image) {
        res.status(404).json({ success: false, error: 'Image not found' });
      } else {
        return image.destroy();
      }
    })
    .then(() => {
      res.status(200).json({ success: true, message: 'Image deleted successfully' });
    })
    .catch((error) => {
      res.status(500).json({ success: false, error: error.message });
    });
};
