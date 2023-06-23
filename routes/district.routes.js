const controller = require('../controllers/district.controller');
const route = require('express').Router();
const verifyToken = require('../middleware');

route.post('/',  controller.create);
route.get('/',  controller.findAll);
route.get('/:id',  controller.findOne);
route.put('/:id',  controller.update);
route.delete('/:id',  controller.delete);
route.delete('/', controller.deleteAll); // Route for deleting all districts

module.exports = route;
