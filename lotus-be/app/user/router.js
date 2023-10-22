const { Router } = require('express');
const router = Router()
const User = require('./models/schema')
const jwt = require('jsonwebtoken')
const { userRoles } = require('./roles');
const { logger } = require('../../common/logger');

/** These routes Interact with user Collection */



// Fetch User Details 
router.get('/', async (req,res,next)=>{
    const { _id: userId , roles } = req.user
    let userData = {}
    logger.info(roles)
    if(roles.includes(userRoles.ADMIN)){
        console.log('ADMIN')
        userData = await User.find({})
    }else{
        userData =await User.findById(userId)
    }
    res.send(userData)
})





module.exports = router