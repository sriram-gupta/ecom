const mongoose = require('mongoose');
// Define your MongoDB connection URI
const uri = `mongodb+srv://${process.env.MONGO_DB_USERNAME}:${process.env.MONGO_DB_PASSWORD}@lotus-db.crzkiim.mongodb.net/${process.env.MONGO_DATABASE}?retryWrites=true&w=majority`;

mongoose.connect(uri, { useNewUrlParser: true });

const db = mongoose.connection;

db.on('error', console.error.bind(console, 'connection error:'));
db.once('open', function() {
  console.log('Mongo Database connected successfully');
});



module.exports = {
    db
}
