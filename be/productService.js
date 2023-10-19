const delayedProductList =  async (t) => {
    return new Promise(async (resolve, reject)=>{
        try {
            const apiResp = await fetch('https://dummyjson.com/products')
        data = await apiResp.json()
        setTimeout( () =>{
            resolve(data)
        },t*1000 )
        } catch (error) {
            reject({})
        }
        
    })
}

module.exports = {
    delayedProductList
}