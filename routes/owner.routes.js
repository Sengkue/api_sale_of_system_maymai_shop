const controller = require('../controllers/owner.controller');
const route = require('express').Router();
const verifyToken = require('../middleware');

route.post('/', controller.create);
route.get('/', verifyToken, controller.findAll);
route.get('/:id', verifyToken, controller.findOne);
route.put('/:id', controller.update);
route.delete('/:id', verifyToken, controller.delete);

module.exports = route;
