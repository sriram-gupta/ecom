const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
const { delayedProductList } = require('./productService')
const PORT = process.env.PORT || 5000;

const app = express();

app.use(cors({
    origin: "*"
}));
app.use(bodyParser.json());



app.get("/products", async (req,res)=>{
    const data = await delayedProductList(4);
    res.send(data)
})


app.get("/health", (req,res)=> res.send("healthy"));
 

app.listen(PORT , () => {
    console.log(`Application running on ${PORT}`)
})