const express = require('express');
const User = require('../models/user');

const authRouter = express.Router();

authRouter.post('/api/signup', (req,res)=>{
    const {name,email,password}=req.params;
    //^ it is checking email exist or nor
    const existingUser = User.findOne({email});
});

module.exports = authRouter;