require('dotenv').config();

const express = require('express');
const session = require('express-session');
const passport = require('./config/passport');
const db = require('./models');
const SequelizeStore = require('connect-session-sequelize')(session.Store);
const helmet = require('helmet');
const morgan = require('morgan');


const app = express();
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

app.use(session({
    secret: process.env.SESSION_SECRET,
    resave: false,
    saveUninitialized: false,
    store: new SequelizeStore({ db: db.sequelize, tableName: 'sessions' }),
}));

app.use(passport.initialize());
app.use(passport.session());

app.use(helmet());
app.use(morgan('combined'));

// Routes
app.use('/auth', require('./routes/auth'));
app.use('/reviews', require('./routes/reviews'));

app.use((req, res) => {
    res.status(404).json({
        status: 'error',
        message: 'Not Found'
    });
});

db.sequelize.sync({force: false}).then(() => {
    app.listen(3000, () => console.log('Server running on http://localhost:3000'));
});
