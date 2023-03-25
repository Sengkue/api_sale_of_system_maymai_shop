const category = require('./category.routes');
const route = require('express').Router();

route.use('/category', category);

module.exports = route;