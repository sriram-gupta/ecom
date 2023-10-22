require('dotenv').config()
const { logger } =  require('./common/logger')
const express = require('express')
const app = express()
const PORT = process.env.PORT || 5000
require('./common/db/mongo')
const userRouter = require('./app/user/router')
const authRouter = require('./app/auth/router')
const productRouter = require('./app/catalog/product/router')
const categoryRouter = require('./app/catalog/category/router')

const auth = require('./app/auth/index')
app.use(express.json())

app.get('/health', async (req, res, next) => {
    logger.info(`Doing Health Check`)
    res.status(200).send({ status: 'ok', message: 'Healthy' })
})

app.use(auth.attachUser)

app.use('/user',userRouter)
app.use('/auth',authRouter)
app.use('/catlog', productRouter)
app.use('/catlog',categoryRouter)


app.listen(PORT, (err)=>{
    if(err){
        logger.info(`Error while building the server up ${err}`)
    }else{
        logger.info(` Application is running on ${PORT}`)
    }
})