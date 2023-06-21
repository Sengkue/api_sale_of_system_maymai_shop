const route = require('express').Router();
const category = require('./category.routes');
const product = require('./product.routes');
const user = require('./user.routes');
const customer = require('./customer.routes'); // Add this line to import the customer routes

route.use('/category', category);
route.use('/product', product);
route.use('/user', user);
route.use('/customer', customer); // Add this line to mount the customer routes

module.exports = route;