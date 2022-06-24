const jwt = require("jsonwebtoken");

const auth = async (req, res, next)=>{
    try {
        
    } catch (err) {
        res.status(500).json({error: err.message});
    }
};

module.exports = auth;