const { Router } = require('express');
const router = Router()
const User = require('./models/schema')

/** These routes Interact with user Collection */

router.post('/registration', async (req, res, next) => {
    const { username, email, phone_number } = req.body
    if (!phone_number) {
        res.status(500).send(`username , password are mandatory fields`)
    }

    try {
        // check if user Already exists 
        const existingUser = await User.findOne({ phone_number: phone_number })
        if(existingUser){
            res.send('User Already Exists');
        }else{
            const newUser =  new User({ phone_number: phone_number })
            const resp = await newUser.save();
            res.status(201).send(resp)
        }        
    } catch (error) {
        // console.log(error)
        res.status(500).send()
    }


    // Insert the user in db , verifyOtp , generate Token 

    // send user Details and token in response

})

router.post('/login', async (req, res, next) => {

})

router.put('/update', async (req, res, next) => {

})

router.delete('/', async (req, res, next) => {

})

module.exports = router