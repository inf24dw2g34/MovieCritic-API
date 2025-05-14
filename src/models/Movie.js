module.exports = (sequelize, DataTypes) => {
    const Movie = sequelize.define('Movie', {
        title: { type: DataTypes.STRING, allowNull: false },
        description: { type: DataTypes.TEXT, allowNull: false },
        year: { type: DataTypes.INTEGER, allowNull: false },
        duration: { type: DataTypes.INTEGER, allowNull: false },
    },
        {
            tableName: 'movies',
            freezeTableName: true,
        }
    );

    Movie.associate = (models) => {
        Movie.belongsTo(models.Director, { foreignKey: 'directorId' });
        Movie.hasMany(models.Review, { foreignKey: 'movieId', onDelete: 'CASCADE' });
    }

    return Movie;
}