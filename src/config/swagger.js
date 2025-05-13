const swaggerJSDoc = require("swagger-jsdoc");
const swaggerDefinition = require('../docs/swaggerDef')
const path = require("path");

const options = {
    swaggerDefinition,
    apis: [path.join(__dirname, "../docs/**/*.yaml")],
};

const swaggerDocs = swaggerJSDoc(options);

module.exports = swaggerDocs;