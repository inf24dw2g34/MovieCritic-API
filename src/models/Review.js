module.exports = (sequelize, DataTypes) => {
    const Review = sequelize.define('Review', {
        content: { type: DataTypes.STRING, allowNull: false },
        rating: {
            type: DataTypes.INTEGER,
            allowNull: true,
            validate: {
                min: 1,
                max: 5,
            }
        },
    },
        {
            tableName: 'reviews',
            freezeTableName: true,
            indexes: [
                {
                    unique: true,
                    fields: ['userId', 'movieId'],
                }
            ]
        });

    Review.associate = (models) => {
        Review.belongsTo(models.Movie, {foreignKey: 'movieId'});
        Review.belongsTo(models.User, { foreignKey: 'userId' });
    }

    return Review;
}