const controller = require('../controllers/customer.controller');
const route = require('express').Router();
const verifyToken = require('../middleware');

route.post('/', controller.create);
route.post('/login', controller.login);
route.get('/', verifyToken, controller.findAll);
route.get('/:id', controller.findOne);
route.put('/:id', controller.update);
route.put('/password/:id', controller.update_password);
route.delete('/:id', controller.delete);

module.exports = route;
