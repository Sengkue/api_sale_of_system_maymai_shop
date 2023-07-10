const controller = require('../controllers/product.controller');
const route = require('express').Router();

route.post('/', controller.create);
route.get('/', controller.findAll);
route.get('/limit', controller.findByLimit);
route.get('/:id', controller.findOne);
route.put('/:id/subtract-quantity', controller.subtractQuantity); // Added subtract-quantity route
route.put('/:id/subtract-import-quantity', controller.subtractImportQuantity); // Added subtract-quantity route
route.put('/:id', controller.update);
route.delete('/deleteAll', controller.deleteAll);
route.delete('/:id', controller.delete);
route.get('/category/:category_id', controller.getProductsByCategoryId);
route.get('/supplier/:supplier_id', controller.getProductsBySupplierId);


module.exports = route;
