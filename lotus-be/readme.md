crypto.randomBytes(64).toString('hex')


now the basic auth setup is done . using OTP 


For any ecom : 
Database design is crucial as it is the digitial foortprint of
what company is about and what it sells. 

Let's identify the enteties first , then their relationships
Befor  that we need to list down the major usecases/flows our platform
will support. 


1. User should be able to login/signup using OTP method.
2. User should be able to browse the catalog products
3. User should be able to add products to cart. 
4. User should be able to place the order after succesfull payment. 
5. User should be able to cancel the order if not required. 
6. User should be able to add/select addresses for order. 



enteties: 
User 
Catalog ( Products , Categories ) 
Cart
Orders 
Payment 
Address


For Our usecase we will be using mongoDb for Everything. 
Assumption : 
1. Infinite Inventory (No need to worry about inventory management)
2. Static Pricing ( No product's price changes )
3. No concurrency handling <> as ::infinite:: inventory
4. No ACID transaction required 














