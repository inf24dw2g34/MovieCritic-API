// models/Like.js
const { DataTypes } = require('sequelize');
const sequelize = require('./index');
const User = require('./User');
const Review = require('./Review');

const Like = sequelize.define('Like', {});

User.belongsToMany(Review, { through: Like, as: 'LikedReviews' });
Review.belongsToMany(User, { through: Like, as: 'Likers' });

module.exports = Like;
