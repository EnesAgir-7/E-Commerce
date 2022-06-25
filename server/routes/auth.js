const express = require('express');
const User = require('../models/user');
const bcryptjs = require('bcryptjs');

const authRouter = express.Router();
const jwt = require("jsonwebtoken");
const auth = require("../middlewares/auth");

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

//* sign In
authRouter.post("/api/signin", async (req, res) => {
    try {
        const { email, password } = req.body;
        const user = await User.findOne({ email });
        if (!user) {
            return res.status(400).json({ msg: "User with this email does not exist!" });
        }

        const isMatch = await bcryptjs.compare(password, user.password);
        if (!isMatch) {
            return res.status(400).json({ msg: "Incorrect password." });
        }

        const token = jwt.sign({ id: user._id }, "passwordKey");
        res.json({ token, ...user._doc });
    } catch (e) {
        res.status(500).json({ error: e.message });
    }
});

//*  jsonwebtoken
authRouter.post("/tokenIsValid", async (req, res) => {
    try {
        const token = req.header("x-auth-token");
        if (!token) return res.json(false);
        const verified = jwt.verify(token, "passwordKey");
        if (!verified) return res.json(false);

        const user = await User.findById(verified.id);
        if (!user) return res.json(false);
        res.json(true);
    } catch (e) {
        res.status(500).json({ error: e.message });
    }
});


//* get user data
authRouter.get("/", auth, async (req, res) => {
    const user = await User.findById(req.user);
    res.json({ ...user._doc, token: req.token });
});


module.exports = authRouter;