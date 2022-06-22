const express = require('express');
const User = require('../models/user');
const bcryptjs = require('bcryptjs');

const authRouter = express.Router();


//* Sign Up
authRouter.post('/api/signup',async (req,res)=>{
    try {
        const {name,email,password}=req.body;
        //^ it is checking email exist or nor
        const existingUser = await User.findOne({email});
        if(existingUser){
            return res.status(400).json({msg:'User with same email already exist'});
        }

        //! 8 is salt. salt is a random string and when hash a text for add a salt to it
        //! the hash algo output is no longer predictable to 
        const hashPassword = await bcryptjs.hash(password, 8);

        let user = new User({
            email,
            password: hashPassword,
            name,
        })
        user =await user.save();
        //^ send data to the client side
        res.json(user);
    } catch (er) {
        res.status(500).json({error:er.message});
    }
});

module.exports = authRouter;