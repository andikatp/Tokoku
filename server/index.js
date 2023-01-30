//import from package
const express = require('express');

//import from files
const authRouter = require("./routes/auth.js");
const app = express();

//middleware
app.use(authRouter);

//init

const PORT = 3000;

app.listen(PORT, ()=> {
    console.log(`connected at port ${PORT}`);
});

