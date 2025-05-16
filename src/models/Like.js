module.exports = (sequelize, DataTypes) => {
    const Like = sequelize.define(
        "Like",
        {},
        {
            tableName: "likes",
            freezeTableName: true,
        }
    );

    Like.associate = (models) => {
        models.User.belongsToMany(models.Movie, {
            through: Like,
            foreignKey: "userId",
            otherKey: "movieId",
            as: "Likes",
            onDelete: "CASCADE"
        });
        models.Movie.belongsToMany(models.User, {
            through: Like,
            foreignKey: "movieId",
            otherKey: "userId",
            as: "Likes",
            onDelete: "CASCADE"
        });
    };

    return Like;
};
