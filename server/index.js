const express = require('express');
const mongoose = require('mongoose');
const adminRouter = require('./routes/admin');

const authRouter = require('./routes/auth');
const productRouter = require('./routes/product');
const userRouter = require('./routes/user');

//! .env
const PORT = 3000;
const DB = "mongodb+srv://enes:qweasdzxc123@cluster0.gphgii1.mongodb.net/?retryWrites=true&w=majority"
const app = express();

//! middleware
app.use(express.json());
app.use(authRouter);
app.use(adminRouter);
app.use(productRouter);
app.use(userRouter);

//! Database connections
mongoose.connect(DB).then(()=>{
    console.log('Connected MongoDB');
}).catch(e=>{
    console.log(e);
})

// * "0.0.0.0" reason need to specify this ip address is because
// * android if use localhost won't work
// * can be accessed from anywhere
app.listen(PORT, "0.0.0.0",()=>{
    console.log(`connected at port ${PORT}`);
})
