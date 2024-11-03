const { response } = require("express");
const User = require("../models/user");
const { getInitialdataUser1, getInitialdataUser2 } = require("../helpers/users_const_data");

const getUsers = async (req,res = response)=>{

    const users = await User.find()

    return res.status(200).json({
        'ok': true,
        'msg': "users get",
        users
    });
}

const addInitialUsers = async ()=>{
    const userId1 = "1244";
    const userId2 = "1255";

    const alreadyCreate1 = await User.findOne({user_id: userId1})

        if(!alreadyCreate1){
            const data = getInitialdataUser1();
            const user1 = new User({
                user_id: userId1,
                data: [...data]
            })
            await user1.save()
        }
    const alreadyCreate2 = await User.findOne({user_id: userId2})
    if(!alreadyCreate2){
        const data = getInitialdataUser2();
        const user2 = new User({
            user_id: userId2,
            data: [...data]
        })
        await user2.save()
    }
    
}


module.exports = {
    getUsers,
    addInitialUsers
}

