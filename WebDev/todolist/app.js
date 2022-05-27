const express = require("express");
const bodyParser = require('body-parser');

const app = express();

app.get("/",(req,res) => {
    res.send("hello");
});

app.listen(3000,(req,res) => {
    console.log("server started on "+ 3000);
});

