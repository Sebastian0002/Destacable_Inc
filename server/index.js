const express = require('express');
const cors = require('cors');
const path = require('path');
const bodyParser = require('body-parser');
const { addInitialUsers } = require('./controllers/users');
require('dotenv').config();

// DB Config
require('./database/config').dbConnection();


// App de Express
const app = express();

app.use(cors());
app.use( express.json() );

const server = require('http').createServer(app);


const publicPath = path.resolve( __dirname, 'public' );
app.use(bodyParser.urlencoded({extended : true}));
app.use( express.static( publicPath ));
app.use(express.json());

app.use( '/api/users', require('./routes/users') );

addInitialUsers();



server.listen( process.env.PORT, ( err ) => {
    if ( err ) throw new Error(err);
    console.log('running server in port', process.env.PORT );
});


