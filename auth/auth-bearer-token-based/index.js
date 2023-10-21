const express = require('express');
const app = express()
const port = process.env.PORT || 5000
const jwt = require('jsonwebtoken')


const validTokens = [];

app.get('/health', (req, res, next) => {
    res.send('Healthy')
})

/**
 * 
 * @param {express.Request} req 
 * @param {express.Response} res 
 * @param {express.NextFunction} next 
 */
const authenticateUserGenerateToken = async (req, res, next) => {
    const Authorization = req.headers.authorization.split(' ')[1]
    const [username, password] = Buffer.from(Authorization, 'base64').toString('utf-8').split(':')
    if (username == "admin" && password == "admin") {
        // Generate Token + Verify Token during Validation
        const token = jwt.sign({ id: 1, username, password }, 'my_secret', { expiresIn: '1 hr' })
        req['token'] = token
        next()
    } else {
        next('Wrong UserName & password ')
    }
}

// We use basic authentication for Token Generation [ Identity Generation ]
app.post('/login', authenticateUserGenerateToken, async (req, res, next) => {
    res.send({ token: req['token'] })
})

/**
 * 
 * @param {express.Request} req 
 * @param {express.Response} res 
 * @param {express.NextFunction} next 
 */
const checkTokenAuthentication = (req, res, next) => {
    const Authorization = req.headers['authorization'].split(' ')[1]
    const tokenData = jwt.decode(Authorization);

    // Convert iat (Issued At) and exp (Expiration) timestamps to Date objects
    const iatDate = new Date(tokenData.iat * 1000); // Multiply by 1000 to convert to milliseconds
    const expDate = new Date(tokenData.exp * 1000);

    console.log('Issued At (iat):', iatDate.toUTCString());
    console.log('Expiration Time (exp):', expDate.toUTCString());

    jwt.verify(Authorization, 'my_secret', (err,user)=>{
        if(err){
            console.log(err.name)
            return res.status(403).json({message: err.name})
        }
        req.user = user;
        next()
    })
    

}


app.get('/bearer', checkTokenAuthentication, async (req, res) => {
    res.send('Bearer Secret Message')
})

app.listen(port, (err) => {
    if (err) {
        console.log(`Error while starting Application`)
    } else {
        console.log(`Application started on port ${port}`)
    }
})