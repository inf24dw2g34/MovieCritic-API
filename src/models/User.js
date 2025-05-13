module.exports = (sequelize, DataTypes) => {
    const User = sequelize.define('User', {
        googleId: { type: DataTypes.STRING, unique: true },
        name: { type: DataTypes.STRING, allowNull: false },
        email: { type: DataTypes.STRING, allowNull: false, unique: true },
        profile_picture: {
            type: DataTypes.STRING,
            allowNull: true,
            defaultValue: null,
        },
        role: {
            type: DataTypes.STRING,
            defaultValue: 'user',
            validate: {
                isIn: [['user', 'admin']],
            },
        },
    },
        {
            tableName: 'users',
            freezeTableName: true,
        }
);

    User.associate = (models) => {
        User.hasMany(models.Review, { foreignKey: 'userId' });
    }

    return User;
}
