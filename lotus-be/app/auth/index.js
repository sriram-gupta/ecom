const jwt = require('jsonwebtoken')
const { logger } = require('../../common/logger')



const attachUser = async (req,res,next) => {
    if(!req.headers['authorization']){
        return next();
    }

    const Authorization = req.headers['authorization'].split(' ')[1]
    jwt.verify(Authorization, process.env.ACCESS_TOKEN_SECRET, (err,user)=>{
        if(err){
            logger.info(err.name)
            return res.status(403).json({message: err.name})
        }
        req.user = user;
        return next()
    })

}

module.exports = {
    attachUser
}