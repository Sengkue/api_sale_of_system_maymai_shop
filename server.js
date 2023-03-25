const express = require("express");
const app = express();
const cors = require("cors");
const bodyParser = require("body-parser");
require("dotenv").config();
require("./config/db");
const routes = require("./routes/routes");

app.use(cors());
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: true}));
app.use(routes);

app.get("/", (req, res) => {
  return res.json("welcome to node api");
});

app.post("/api", (req, res) =>{
    console.log(req.body);
    res.send("Hello world!");
});

const port_A = 8080;
const port = process.env.PORT || port_A;
app.listen(port, () => {
  console.log(`Server is runing on port ${port}`);
});
