const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
const PORT = process.env.PORT || 5000;

const app = express();

const { delayedProductList } = require('./productService')

const passport = require('passport');
const passportLocal = require('passport-local');
app.use(passport.initialize());
app.use(passport.session());

 




// UserName Password based auth strategy
const LocalStrategy = passportLocal.Strategy;

passport.use('username_password_strategy', new LocalStrategy(
    function verify(username, password, done) {
        if (username === "admin" && password === "admin") {
          return done(null,  "encrypted_token" );
        } else {
          return done(null, false, { message: 'Invalid credentials' });
        }

      }
  ));
  
app.get('/secret', passport.authenticate('username_password_strategy'), async (req,res)=>{
    res.send('Yuhooo')
})




app.use(cors({
    origin: "*"
}));
app.use(bodyParser.json());



app.get("/products", async (req,res)=>{
    console.log('Get called ')
    const data = await delayedProductList(0);
    res.send(data)
})


  

app.get("/health",  (req,res)=> res.send("healthy"));
 

app.listen(PORT , () => {
    console.log(`Application running on ${PORT}`)
})