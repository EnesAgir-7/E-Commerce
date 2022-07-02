const express = require("express");
const auth = require("../middlewares/auth");
const { Product } = require("../models/product");
const User = require("../models/user");
const userRouter = express.Router();

userRouter.post("api/add-to-cart", auth, async(req, res)=>{
    try {
        const {id} = req.body;
        const product = await Product.find(id);
        let user = await User.findById(req.user);

        if (user.card.length == 0) {
            user.card.push({ product, quantity:1});
        } else {
            let isProductFound = false;
            for(let i =0; i<user.card.length;i++){
                if(user.card[i].product._id.equals(product._id)){
                    isProductFound = true;
                }
            }
            if (isProductFound) {
                let product2 = user.cart.find((product1) => product1.product._id.equals(product._id));
                product2.quantity += 1;
            } else {
                user.cart.push({ product, quantity: 1 });
            }
        }
        user = await user.save();
        res.json(user);
    } catch (err) {
        res.status(500).json({error: err.message});
    }
});


module.exports = userRouter;