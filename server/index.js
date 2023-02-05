//import from package
const express = require('express');
const mongoose = require('mongoose');

mongoose.set('strictQuery', true);

//import from files
const authRouter = require("./routes/auth.js");
const app = express();
const DB = 'mongodb+srv://andikatp:andikatp123@cluster0.54kgvzs.mongodb.net/?retryWrites=true&w=majority';

//middleware
app.use(express.json());
app.use(authRouter);

//connection
mongoose.connect(DB).then(()=>{
    console.log(`connection successful`);
}).catch((e)=>{
    console.log(e);
});



//init
const PORT = 3000;

app.listen(PORT, "0.0.0.0", ()=> {
    console.log(`connected at port ${PORT}`);
});

