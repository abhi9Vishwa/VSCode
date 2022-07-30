var mongoose = require('mongoose');
var Schema = mongoose.Schema;

var UserSchema = new Schema({
    email: {
        type: String,
        require: true,
        index: true,
        unique: true,
    },
    username: {
        type: String,
        require: true,
        unique: true,
    },
    password: {
        type: String,
        require: true,
    },
    token: {
        type: String,
    }
});

module.exports = mongoose.model('users', UserSchema);