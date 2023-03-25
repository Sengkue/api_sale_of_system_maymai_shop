const express = require('express');
const cors = require('cors');
const bodyParser = require('body-parser');
require('dotenv').config();
require('./config/db');

const app = express();
app.unsubscribe(cors());
app.use(bodyParser.json());

app.get('/',(req, res)=>{
    return res.json('welcome to node api');
});

const port_A = 8080;
const port = process.env.PORT || port_A
app.listen(port, ()=>{
    console.log(`Server is runing on port ${port}`);
})