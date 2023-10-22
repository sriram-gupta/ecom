const { Router } = require('express');
const router = Router()
const User = require('../user/models/schema')
const jwt = require('jsonwebtoken')

router.post('/generateOtp', async (req, res, next) => {
    const { phone_number } = req.body
    if (!phone_number) {
        res.status(500).send(`Phone number is mandatory`)
    }

    try {
        const otp = String(phone_number).substring(phone_number.length-4) 
        res.send({ status: "success", message: `otp sent succesfully ${otp} ` , otp} )

    } catch (error) {
        // console.log(error)
        res.status(500).send()
    }

})



// verify otp 
const verifyOtp = (phone_number, otp) => String(phone_number).substring(phone_number.length-4)  == otp
     

router.post('/verifyOtp', async (req, res, next) => {
    const { otp, phone_number } = req.body
    if (!phone_number || !otp) {
        res.status(500).send(`mandatory otp and phone_number`)
    }

    try {

        const isValid = verifyOtp(phone_number, otp)
        if (!isValid) res.status(401).send(`Invalid OTP`)

        let userData = {}


        // check if user Already exists 
        const userResp = await User.findOne({ phone_number: phone_number });
        if (userResp) {
            userData = userResp
        } else {
            userData = await new User({ phone_number: phone_number }).save()
        }

        const accessToken = jwt.sign(JSON.parse(JSON.stringify(userData)), process.env.ACCESS_TOKEN_SECRET, { expiresIn: '1h' });
        // Generate a refresh token and save it to the user's document
        const refreshToken = jwt.sign(JSON.parse(JSON.stringify(userData)), process.env.REFRESH_TOKEN_SECRET, { expiresIn: '10d' });
        res.send({ accessToken, refreshToken })

    } catch (error) {
        console.log(error)
        res.status(500).send()
    }

})

// Route to refresh the access token using the refresh token
router.post('/refreshToken', async (req, res) => {
  const { refreshToken } = req.body;

  if (!refreshToken) {
    return res.status(400).send('Refresh token is required');
  }

  try {
    // Verify the refresh token and extract the user ID
    const decoded = jwt.verify(refreshToken, process.env.REFRESH_TOKEN_SECRET);

    console.log(decoded)
    // Check if the user exists
    const userData = await User.findById(decoded._id);

    if (!userData) {
      return res.status(401).send('Invalid refresh token');
    }
    // Generate a new access token
    const accessToken = jwt.sign(JSON.parse(JSON.stringify(userData)), 'my_secret_key', {
      expiresIn: '1h', // Access token expiration time (adjust as needed)
    });


    res.json({ accessToken });
  } catch (error) {
    console.error(error);
    res.status(500).send('Internal Server Error');
  }
});

module.exports = router