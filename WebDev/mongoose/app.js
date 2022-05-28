const mongoose = require('mongoose');

mongoose.connect("mongodb://127.0.0.1:27017/peopleDB", { useNewUrlParser: true });

const peopleSchema = new mongoose.Schema({
    name: String,
    age: Number,
    rating: Number
});

const People = mongoose.model("People", peopleSchema);

const people = new People({
    name: "Alpha flaghsip",
    age: 19,
    rating: 4.8,
});

// people.save();

