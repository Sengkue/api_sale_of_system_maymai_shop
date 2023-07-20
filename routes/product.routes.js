const controller = require('../controllers/product.controller');
const route = require('express').Router();

route.post('/', controller.create);
route.get('/', controller.findAll);
route.get('/limit', controller.findByLimit);
route.put('/:id/subtract-quantity', controller.subtractQuantity);
route.get('/almost-out-of-stock', controller.getProductsAlmostOutOfStock); // New route for almost out of stock
route.put('/:id/subtract-import-quantity', controller.subtractImportQuantity);
route.put('/:id', controller.update);
route.delete('/deleteAll', controller.deleteAll);
route.delete('/:id', controller.delete);
route.get('/category/:category_id', controller.getProductsByCategoryId);
route.get('/supplier/:supplier_id', controller.getProductsBySupplierId);
route.get('/by-quantity', controller.getProductsByQuantity);
route.get('/:id', controller.findOne);

module.exports = route;
