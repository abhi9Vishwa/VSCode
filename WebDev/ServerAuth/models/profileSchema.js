var mongoose = require('mongoose');
var Schema = mongoose.Schema;

var ProfileSchema = new Schema({
    username: {
        type: String,
        unique: true,
        index: true,
        require: true,
    },
    name: {
        type: String,
        require: true,
    },
    college: {
        type: String,
    },
    graduationYear: {
        type: Date,
    },
    password: {
        type: String,
        require: true,
    },
    token: {
        type: String,
        // require: true,
    }
});

module.exports = mongoose.model('profiles', ProfileSchema);