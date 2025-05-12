// models/Review.js
const { DataTypes } = require('sequelize');
const sequelize = require('./index');
const User = require('./User');

const Review = sequelize.define('Review', {
    movieTitle: DataTypes.STRING,
    content: DataTypes.TEXT,
});

Review.belongsTo(User, { foreignKey: 'userId' });
User.hasMany(Review, { foreignKey: 'userId' });

module.exports = Review;
