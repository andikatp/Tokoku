const express = require('express');
const User = require("../models/user");
const authRoute = express.Router();

authRoute.post('/api/signup', async (req, res) => {
   const {name, email, password} = req.body;
   const existingUser = await User.findOne({email });
   if(existingUser){
    return res.status(400).json({msg:"user with the same email already exist!"});
   }
   let user = new User({
    email,
    password,
    name,
   });
   user = await user.save();
   res.json(user);
});

module.exports = authRoute;