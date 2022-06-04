//jshint esversion:6
const mongoose = require('mongoose');
const express = require("express");
const bodyParser = require("body-parser");
const date = require(__dirname + "/date.js");

const app = express();

app.set('view engine', 'ejs');

app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.static("public"));
mongoose.connect("mongodb://127.0.0.1:27017/todolistDB", { useNewUrlParser: true });

const listSchema = new mongoose.Schema({
  name: String,
})

const Item = mongoose.model("Item", listSchema);

const item1 = new Item({
  name: "Take Rest",
});
const item4 = new Item({
  name: "Welcome to your todolist",
});
const item2 = new Item({
  name: "Hit + to add tasks",
});
const item3 = new Item({
  name: "Click checkbox to delete the task",
});
const defaultList = [item4, item2, item3];
// item1.save();



// const items = ["Buy Food", "Cook Food", "Eat Food"];
const workItems = [];

app.get("/", function (req, res) {
  Item.find({}, (err, foundItems) => {
    // console.log(foundItems);
    if (foundItems.length == 0) {

      Item.insertMany(defaultList, (err) => {
        if (err) {
          console.log(err);
        } else {
          console.log("Successfully added default list");
        }
      })
    }
    res.render("list", { listTitle: "Today", newListItems: foundItems });
  })
  const day = date.getDate();


});

app.post("/", function (req, res) {

  const item = req.body.newItem;
  var newItem = new Item({
    name: item,
  })
  newItem.save();
  console.log(newItem);
  if (req.body.list === "Work") {
    workItems.push(item);
    res.redirect("/work");
  } else {
    // items.push(item);
    res.redirect("/");
  }
});

app.post("/delete", (req, res) => {
  console.log(req.body);
})

app.get("/work", function (req, res) {
  res.render("list", { listTitle: "Work List", newListItems: workItems });
});

app.get("/about", function (req, res) {
  res.render("about");
});

app.listen(3000, function () {
  console.log("Server started on port 3000");
});
