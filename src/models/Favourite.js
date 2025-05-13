module.exports = (sequelize, DataTypes) => {
    const Favourite = sequelize.define('Favourite', {}, {
        tableName: 'favourites',
        freezeTableName: true,
    });

    Favourite.associate = (models) => {
        models.User.belongsToMany(models.Movie, { through: Favourite, foreignKey: 'userId', otherKey: 'movieId' });
        models.Movie.belongsToMany(models.User, { through: Favourite, foreignKey: 'movieId', otherKey: 'userId' });
    }

    return Favourite;
}