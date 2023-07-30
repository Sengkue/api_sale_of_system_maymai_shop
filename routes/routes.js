const route = require('express').Router();
const category = require('./category.routes');
const product = require('./product.routes');
const user = require('./user.routes');
const customer = require('./customer.routes');
const upload = require('../uploads/upload.product');
const productImage = require('./productImage.routes');
const Employee = require('./employee.routes');
const Owner = require('./owner.routes');
const Banner = require('./banner.routes');
const Location = require('./location.routes');
const Province = require('./province.routes');
const district = require('./district.routes');
const supplierRoutes = require('./supplier.routes');
const promotion = require('./promotion.routes');
const color_size = require('./color_size.routes');
const sale = require('./sale.routes');
const sale_detail = require('./sale_detail.routes');
const Import = require('./import.routes');
const Import_detail = require('./import_detail.routes');
const order = require('./order.routes');
const order_detail = require('./order_detail.routes');
// const imageSlide = require('./image_slides.routes');

route.use('/category', category);
route.use('/product', product);
route.use('/user', user);
route.use('/customer', customer);
route.use('/upload', upload);
route.use('/image', productImage);
route.use('/employee', Employee);
route.use('/owner', Owner);
route.use('/banner', Banner);
route.use('/location', Location);
route.use('/province', Province);
route.use('/district', district);
route.use('/supplier', supplierRoutes);
route.use('/promotion', promotion);
route.use('/color_size', color_size);
route.use('/sale', sale)
route.use('/saleDetail', sale_detail)
route.use('/import', Import)
route.use('/import_detail',Import_detail)
route.use('/order',order)
route.use('/order_detail',order_detail)
// route.use('/slide', imageSlide)

module.exports = route;
