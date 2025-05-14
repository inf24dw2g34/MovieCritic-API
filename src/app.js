require('dotenv').config();
const port = process.env.PORT || 3000;
const host_port = process.env.HOST_PORT || port;

const express = require('express');
const session = require('express-session');
const swaggerUi = require("swagger-ui-express");
const swaggerDocs = require("./config/swagger");
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
app.use(morgan('dev'));

app.use("/docs", swaggerUi.serve, swaggerUi.setup(swaggerDocs));

// Routes
app.use('/auth', require('./routes/auth'));
app.use('/reviews', require('./routes/reviews'));

app.use((req, res) => {
    res.status(404).json({
        message: 'Error: Not Found'
    });
});

db.sequelize.sync({alter: (process.env.NODE_ENV === 'development')}).then(() => {
    console.log('Database synced successfully.');
    app.listen(port, () => {
        console.log(`Server running on http://localhost:${port}`);
        console.log(`Accessible via http://localhost:${host_port}`);
    });
});
