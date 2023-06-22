const controller = require('../controllers/banner.controller');
const route = require('express').Router();
const verifyToken = require('../middleware');

route.post('/', controller.create);
route.get('/', controller.findAll);
route.get('/:id', controller.findOne);
route.put('/:id', controller.update);
route.delete('/:id', controller.delete);

module.exports = route;
