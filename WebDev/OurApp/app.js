const post = require('./model/post');
const userSc = require('./model/user');
const bodyParser = require('body-parser');
const express = require('express')
const app = express()
const port = 3000
const connectToMongo = require('./db');
var bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');


const JWT_SECRET = 'THIS IS a secret shhhhh';





app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.static("public"));
app.set('view engine', 'ejs');

connectToMongo();

app.get('/home', (req, res) => {
    res.render('dashboard.ejs');
})
app.get('/', (req, res) => {
    res.render('home.ejs');
})
app.get('/createPost', (req, res) => {
    res.render('createPost.ejs');
})

app.post('/compose', (req, res) => {
    console.log(req.body);
    const user = new post({
        // author: req.body.author,
        title: req.body.postTitle,
        content: req.body.postBody,
    })
    user.save((err, obj) => {
        if (!err) {
            res.send("saved");

        } else {
            res.send("Error occurred");
        }
    });
});
app.post('/createUser', (req, res) => {
    console.log(req.body);
    const token = jwt.sign({ username }, JWT_SECRET, { expiresIn: '2h' });
    var salt = bcrypt.genSaltSync(10);
    JsonWebTokenError
    var hash = bcrypt.hashSync(req.body.password, salt);
    const user = new userSc({
        email: req.body.email,
        username: req.body.username,
        password: hash,
        token: token
    })
    user.save((err, obj) => {
        if (!err) {
            res.send("saved");

        } else {
            res.send("User already exist");
        }
    });
});
app.post('/loginUser', (req, res) => {
    console.log(req.body);
    const token = jwt.sign({ username }, JWT_SECRET, { expiresIn: '2h' });

    
    userSc.findOne({ username: req.body.username }, (err, user) => {
        if (err) {
            console.log(err);

            
        } else {
            if (user) {
                if (bcrypt.compareSync(req.body.password, user.password)) {
                    console.log("User found");
                    res.render('dashboard.ejs', {
                        user: user,
                        token: token,
                    });
                } else {
                    console.log("Wrong Credentials");
                    res.render('error.ejs');
                }
            } else {

                console.log("User not found");
                res.render('error.ejs');
            }
        }
    });


});

app.listen(port, () => {
    console.log(`Example app listening on port ${port}`)
})