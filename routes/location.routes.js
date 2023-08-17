const controller = require('../controllers/location.controller');
const router = require('express').Router();

router.post('/', controller.createLocation);
router.get('/', controller.getAllLocations);
router.get('/:id', controller.getLocationById);
router.put('/:id', controller.updateLocation);
router.delete('/:id', controller.deleteLocation);

module.exports = router;
