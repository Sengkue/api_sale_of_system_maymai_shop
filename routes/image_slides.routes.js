const express = require("express");
const router = express.Router();
const imageSlideController = require("../controllers/image_slides.controller");

// Create a new image slide
router.post("/", imageSlideController.createImageSlide);

// Get all image slides
router.get("/", imageSlideController.getAllImageSlides);

// Get a single image slide by ID
router.get("/:id", imageSlideController.getImageSlideById);

// Update an image slide by ID
router.put("/:id", imageSlideController.updateImageSlide);

// Delete an image slide by ID
router.delete("/:id", imageSlideController.deleteImageSlide);

module.exports = router;
