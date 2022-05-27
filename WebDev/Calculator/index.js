const express = require('express');
const port = 3000;
const bodyParser = require("body-parser");

const app = express();
app.use(bodyParser.urlencoded({ extended: true }));

app.get('/', (req, res) => {
    res.sendFile(__dirname + "/index.html");
}),

    app.post("/", function (req, res) {
        console.log(req.body);
        var num1 = Number(req.body.num1);
        var num2 = Number(req.body.num2);

        var result = num1 + num2;
        res.send("result is " + result);
    })

app.listen(port, () => {
    console.log(`App listening on port ${port}`)
})