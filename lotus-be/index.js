require('dotenv').config()
const { logger } =  require('./common/logger')
const express = require('express')
const app = express()
const PORT = process.env.PORT || 5000
require('./common/db/mongo')
const userRouter = require('./app/user/router')


app.use(express.json())

app.get('/health', async (req, res, next) => {
    logger.info(`Doing Health Check`)
    res.status(200).send({ status: 'ok', message: 'Healthy' })
})

app.use('/user',userRouter)

app.listen(PORT, (err)=>{
    if(err){
        logger.info(`Error while building the server up ${err}`)
    }else{
        logger.info(` Application is running on ${PORT}`)
    }
})