const controller = require('../controllers/location.controller');
const route = require('express').Router();

route.post('/', controller.createLocation);
route.get('/', controller.getAllLocations);
route.get('/:id', controller.getLocationById);
route.put('/:id', controller.updateLocation);
route.delete('/:id', controller.deleteLocation);

module.exports = route;
