module.exports = (sequelize, DataTypes) => {
    const Like = sequelize.define('Like', {}, {
        tableName: 'likes',
        freezetableTableName: true,
    });

    Like.associate = (models) => {
        models.User.belongsToMany(models.Review, { through: Like, as: 'LikedReviews' });
        models.Review.belongsToMany(models.User, { through: Like, as: 'Likers' });
    }

    return Like;
}