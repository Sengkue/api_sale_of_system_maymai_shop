const controller = require('../controllers/product.controller');
const route = require('express').Router();

route.post('/', controller.create);
route.get('/', controller.findAll);
route.get('/limit', controller.findByLimit); // Move the findByLimit route above the findOne route
route.get('/:id', controller.findOne);
route.put('/:id/subtract-quantity', controller.subtractQuantity);
route.put('/:id', controller.update);
route.delete('/deleteAll', controller.deleteAll);
route.delete('/:id', controller.delete);
route.post('/quantity', controller.subtractQuantity);

module.exports = route;