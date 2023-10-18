const delayedProductList =  async (t) => {
    return new Promise(async (resolve, reject)=>{
        
        const apiResp = await fetch('https://dummyjson.com/products')
        data = await apiResp.json()
        setTimeout( () =>{
            resolve(data)
        },t*1000 )
    })
}

module.exports = {
    delayedProductList
}