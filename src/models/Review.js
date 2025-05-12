module.exports = (sequelize, DataTypes) => {
    const Review = sequelize.define('Review', {
        movieTitle: DataTypes.STRING,
        content: DataTypes.TEXT,
    });

    Review.associate = (models) => {
        Review.belongsTo(models.User, { foreignKey: 'userId' });
        models.User.hasMany(Review, { foreignKey: 'userId' });
    }

    return Review;
}