"use strict";

const { faker } = require("@faker-js/faker");
const { Movie, User } = require("../models");

module.exports = {
    async up(queryInterface, Sequelize) {
        const reviews = [];

        const movies = await Movie.findAll({ attributes: ["id"] });
        const movieIds = movies.map((m) => m.id);

        const users = await User.findAll({ attributes: ["id"] });
        const userIds = users.map((u) => u.id);

        const uniqueReviews = new Set();

        for (let i = 0; i < 30; i++) {
            const movie = faker.helpers.arrayElement(movieIds);
            const user = faker.helpers.arrayElement(userIds);

            const reviewKey = `${movie}-${user}`;
            if (!uniqueReviews.has(reviewKey)) {
                uniqueReviews.add(reviewKey);
                reviews.push({
                    content: faker.lorem.paragraph(),
                    rating: faker.number.int({ min: 1, max: 5 }),
                    movieId: movie,
                    userId: user,
                    createdAt: new Date(),
                    updatedAt: new Date(),
                });
            }
        }

        await queryInterface.bulkInsert("reviews", reviews, {});
    },

    async down(queryInterface, Sequelize) {
        await queryInterface.bulkDelete("reviews", null, {});
    },
};
