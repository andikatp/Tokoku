const express = require('express');
const bcryptjs = require('bcryptjs');
const User = require("../models/user");
const authRoute = express.Router();
const jwt = require('jsonwebtoken');


//signup
authRoute.post('/api/signup', async (req, res) => {
    try{
        const {name, email, password} = req.body;
        const existingUser = await User.findOne({email });
        if(existingUser){
         return res.status(400).json({msg:"user with the same email already exist!"});
        }
        const hashedPassword = await bcryptjs.hash(password, 8);
        let user = new User({
         email,
         password: hashedPassword,
         name,
        });
        user = await user.save();
        res.json(user);
    } catch(e){
        res.status(500).json({error: e.message});
    }
  
});

//signin
authRoute.post('/api/signin', async (req, res)=>{
try{
    const {email, password} = req.body;
    const existingUser = await User.findOne({email});
    if(!existingUser){
        return res.status(400).json({msg: "User with this email does not exist"});
    }
    const isMatch = await bcryptjs.compare(password, existingUser.password);
    if(!isMatch){
        return res.status(400).json({msg: "Incorrect Password"});
    }
    const token = jwt.sign({id: existingUser.id}, "passwordKey" );
    res.json({token, ...existingUser._doc});
}catch(e){
    res.status(500).json({error: e.message});
}
});

module.exports = authRoute;