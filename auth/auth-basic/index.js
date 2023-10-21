const express = require('express');
const app = express();
const port = process.env.PORT || 5000;

/**
 * @param {express.Request} req
 * @param {express.Response} res
 * @param {express.NextFunction} next
 */
const commonEntryPoint = async(req,res,next) =>{
    console.log(`Inside Common Entry Point`)
    console.log(req.url)
    res.setHeader('temp','YOYO')
    next();
}


/**
 * 
 * @param {Int16Array} t 
 * @returns 
 */
const delayerMiddleWear = (t) => async (req,res,next) => new Promise((resolve,reject)=>{
    setTimeout(()=>{
        next()
        resolve()
    },t*1000);
})

/**
 * @param {express.Request} req
 * @param {express.Response} res
 * @param {express.NextFunction} next
 */
const basicAuthenticationMiddleWear = async (req,res,next) => {
    const Authorization = req.headers['authorization'].split(' ')[1];
    // Decoding the Base64 string
    const decodedBuffer = Buffer.from(Authorization, 'base64').toString('utf8')
    const [username,password] = decodedBuffer.split(':')
    if(username=="admin" && password=="admin"){
        next()
    }else{
        next('AUTHENTICATION FAILED BRUH! ')

    }

}

app.use(commonEntryPoint)

app.get('/health', delayerMiddleWear(2), async(req,res)=>{
    res.status(200).send('healthy')
})

app.get('/basic', basicAuthenticationMiddleWear , async (req,res,next) => {
    console.log('FAILED')
    res.send('Basic secretMessage')
})

app.listen(port, (err) => {
    if(err){
        console.log(err)
    }else{
        console.log(`Application started at port ${port}`)
    }
})