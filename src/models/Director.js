module.exports = (sequelize, DataTypes) => {
    const Director = sequelize.define('Director', {
        name: { type: DataTypes.STRING, allowNull: false },
    },
        {
            tableName: 'directors',
            freezeTableName: true,
        }
    );

    Director.associate = (models) => {
        Director.hasMany(models.Movie, { foreignKey: 'directorId' });
    }
    
    return Director;
}