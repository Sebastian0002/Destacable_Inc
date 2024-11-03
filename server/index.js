const express = require('express');
const cors = require('cors');
const path = require('path');
const bodyParser = require('body-parser');
const { addInitialUsers } = require('./controllers/users');
require('dotenv').config();

// DB Config
require('./database/config').dbConnection();


// App Express and configs
const app = express();

app.use(cors());
app.use( express.json() );
app.use( '/api/users', require('./routes/users') );

//creating server
const server = require('http').createServer(app);

//add the users to database if they don't exist
addInitialUsers();


server.listen( process.env.PORT, ( err ) => {
    if ( err ) throw new Error(err);
    console.log('running server in port', process.env.PORT );
});


