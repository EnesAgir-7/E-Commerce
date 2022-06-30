const express = require("express");
const productRouter = express.Router();
const auth = require('../middlewares/auth');
const { Product } = require("../models/product");

//* ------------ Category ------ *//
productRouter.get('/api/products', auth, async(req,res)=>{
    try {
        //console.log(req.query.category);
        const products = await Product.find({category: req.query.category});
        res.json(products);
    } catch (err) {
        res.status(500).json({error: err.message});
    }
});

//* ------------ Search ------ *//
// create a get request to search products and get them
productRouter.get('/api/products/search/:name', auth,async(req,res)=>{
    try {
        const products = await Product.find({
            //! name: req.params.name, -> this also will work but only need to write full name of product
            name:{$regex: req.params.name, $options: "i"}
        });
        res.json(products);
    } catch (err) {
        res.status(500).json({error: err.message});
    }
})


module.exports = productRouter;