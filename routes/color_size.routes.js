const controller = require("../controllers/color_size.controller");
const route = require("express").Router();

route.put("/subtractByColorSizeAndProductId/:id/:product_id", controller.subtractQuantityByColorSizeAndProductId);
route.delete("/:id", controller.delete);
route.put("/subtract/:id", controller.subtractQuantity);
route.get("/byProductId/:product_id", controller.findByProductId);
route.post("/", controller.create);
route.get("/", controller.selectAll);
route.get("/:id", controller.findOne);
route.put("/:id", controller.update);

module.exports = route;
