var mongoose = require('mongoose');
var Schema = mongoose.Schema;

var PostSchema = new Schema({
    author: {
        type: String,
        // require: true,
    },
    title: {
        type: String,
        require: true,
    },
    content: {
        type: String,
        require: true,
    },
    date: {

        type: Date,
        default: Date.now,
    }

});

module.exports = mongoose.model('posts', PostSchema);