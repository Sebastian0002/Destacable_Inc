const { Schema, model } = require('mongoose');

const UserSchema = Schema({
    user_id: {
        type: String,
        required: true
    },
    data :{
        type: Array,
        required: false
    }
});

UserSchema.method('toJSON', function() {
    const { __v, _id, ...object } = this.toObject();
    return object;
})



module.exports = model('User', UserSchema );