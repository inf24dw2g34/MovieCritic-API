module.exports = (sequelize, DataTypes) => {
    const Review = sequelize.define('Review', {
        content: DataTypes.TEXT,
    },
        {
            tableName: 'reviews',
            freezeTableName: true,
        });

    Review.associate = (models) => {
        Review.belongsTo(models.Movie, {foreignKey: 'movieId'});
        Review.belongsTo(models.User, { foreignKey: 'userId' });
    }

    return Review;
}