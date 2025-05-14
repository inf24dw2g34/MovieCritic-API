"use strict";

const { faker } = require("@faker-js/faker");
const { Movie, User } = require("../models");

module.exports = {
    async up(queryInterface, Sequelize) {
        const likes = [];

        const movies = await Movie.findAll({ attributes: ["id"] });
        const movieIds = movies.map((m) => m.id);

        const users = await User.findAll({ attributes: ["id"] });
        const userIds = users.map((u) => u.id);

        const uniqueLikes = new Set();

        for (let i = 0; i < 50; i++) {
            const movie = faker.helpers.arrayElement(movieIds);
            const user = faker.helpers.arrayElement(userIds);

            const likeKey = `${movie}-${user}`;
            if (!uniqueLikes.has(likeKey)) {
                uniqueLikes.add(likeKey);
                likes.push({
                    movieId: movie,
                    userId: user,
                    createdAt: new Date(),
                    updatedAt: new Date(),
                });
            }
        }

        await queryInterface.bulkInsert("likes", likes, {});
    },

    async down(queryInterface, Sequelize) {
        await queryInterface.bulkDelete("likes", null, {});
    },
};
