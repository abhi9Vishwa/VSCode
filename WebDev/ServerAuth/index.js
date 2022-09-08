const express = require("express");
const connectToMongo = require("./models/profiles");
const schema = require("./models/profileSchema");
const app = express();
const router = express.Router();
const bodyParser = require("body-parser");
const jwt = require("jsonwebtoken");
const auth = require("./middleware/auth");
const JWT_SECRET = "There we are again";
const cors = require("cors");

var jsonParser = bodyParser.json()
var urlencodedParser = bodyParser.urlencoded({ extended: false })

const port = 5000;

connectToMongo();
app.use(cors());

app.get('/', (req, res) => {
    res.send('Return ');
});

app.get('/query/:name/', (req, res) => {
    res.send(req.params.name);
    console.log(req.params.name);
});
app.get('/query/', (req, res) => {
    const nameQ = req.query.namequery;
    res.send("hello " + nameQ);
});

//adduser
app.post('/createUser', jsonParser, (req, res) => {
    // res.send('Hello World!');
    console.log('Hello World!');
    console.log(req.body);
    const user1 = new schema({
        name: req.body.name,
        password: req.body.password,
        username: req.body.username,
        college: req.body.college,
        graduationYear: req.body.graduationYear
    })
    user1.save((err, obj) => {
        if (!err) {
            res.send("saved");

        } else {
            res.send("User already exist");
        }
    });
    const { username, name } = req.body;

    const token = jwt.sign({ username, name }, JWT_SECRET, { expiresIn: "22h" });
    user1.token = token;
    console.log(token);
});

//login
app.post('/login', jsonParser, async (req, res) => {
    console.log(req.body);
    const usernameIn = req.body.username;
    const passwordIn = req.body.password;


    if (!(usernameIn && passwordIn)) {
        res.status(400).send("All input is required");
    }

    const user = await schema.findOne({ username: usernameIn });
    console.log(user);
    if (user && (passwordIn === user.password)) {
        const token = jwt.sign({ usernameIn }, JWT_SECRET, { expiresIn: "22h" });
        user.token = token;
        res.json(user);
        console.log(token);
    } else {
        res.send("invalid credentials");
    }
});

app.post("/welcome", auth, (req, res) => {
    res.status(200).send("Welcome 🙌 ");
  });

//Get all user creds
app.get('/getUser', (req, res) => {
    schema.find({})
        .then((userlist) => {
            res.send(userlist);
        });
});

//delete user by matching password and username
app.delete('/deleteUser/', (req, res) => {
    const usernameQuery = req.query.username;
    const passwordQuery = req.query.password;
    let check = true;
    schema.findOne({ username: usernameQuery }, (err, obj) => {
        // res.send(obj);
        if (obj == null) {
            res.send("User doesnot exist");
            check = false;
            // console.log(err);
            // console.log(obj);
        } else {
            if (check && passwordQuery === obj.password) {
                schema.findOneAndDelete({ username: usernameQuery }, (error, obj) => {
                    if (!error) {
                        res.send("User deleted successfully");
                    } else {
                        res.send("error deleting user");
                    }
                });
            } else {
                res.send("wrong credentials" + err);
            }
        }
    });
    //  res.send("delete");
});

//update user details
app.put('/updateUser/', (req, res) => {
    const usernameQuery = req.query.username;
    const passwordQuery = req.query.password;
    const nameUpdate = req.query.name;
    const collegeUpdate = req.query.college;
    const graduationYearUpdate = req.query.graduationYear;
    let check = true;
    schema.findOne({ username: usernameQuery }, (err, obj) => {
        // res.send(obj);
        if (obj == null) {
            res.send("User doesnot exist");
            check = false;
            // console.log(err);
            // console.log(obj);
        } else {
            if (check && passwordQuery === obj.password) {
                schema.findOneAndUpdate({ username: usernameQuery }, { $set: { name: nameUpdate, college: collegeUpdate, graduationYear: graduationYearUpdate } }, (err, obj) => {
                    if (err) {
                        console.log(err);
                    } else {
                        res.send("Details updated succesfully");
                    }
                })
            }
            else {
                res.send("wrong credentials" + err);
            }
        }
    });
    //  res.send("delete");
});

app.listen(port, () => {
    console.log(`Express app listening on port ${port}`);
});