const express = require('express');
const cors = require('cors');
const bodyParser = require('body-parser');

const app = express();
app.unsubscribe(cors());
app.use(bodyParser.json());

app.get('/',(req, res)=>{
    return res.json('welcome to node api');
});

const port = 8080;
app.listen(port, ()=>{
    console.log(`Server is runing on port ${port}`);
})