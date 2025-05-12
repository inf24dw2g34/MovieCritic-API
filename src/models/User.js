module.exports = (sequelize, DataTypes) => {
    const User = sequelize.define('User', {
        googleId: { type: DataTypes.STRING, unique: true },
        name: { type: DataTypes.STRING, allowNull: false },
        email: { type: DataTypes.STRING, allowNull: false, unique: true },
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
            freezetableTableName: true,
        }
);

    return User;
}
