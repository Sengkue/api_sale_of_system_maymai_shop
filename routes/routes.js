const route = require('express').Router();
const category = require('./category.routes');
const product = require('./product.routes');
const user = require('./user.routes');
const customer = require('./customer.routes'); // Add this line to import the customer routes
const upload = require('../uploads/upload.product');
const productImage = require('./productImage.routes');
const Employee = require('./employee.routes');
const Owner = require('./owner.routes');
const Banner = require('./banner.routes');

route.use('/category', category);
route.use('/product', product);
route.use('/user', user);
route.use('/customer', customer); // Add this line to mount the customer routes
route.use('/upload', upload);
route.use('/image', productImage);
route.use('/employee', Employee);
route.use('/owner', Owner);
route.use('/banner', Banner);

module.exports = route;