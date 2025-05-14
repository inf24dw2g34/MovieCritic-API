"use strict";

const { faker } = require("@faker-js/faker");
const { Director } = require("../models");

module.exports = {
    async up(queryInterface, Sequelize) {
        const movies = [];
        const directors = await Director.findAll({ attributes: ["id"] });
        const directorIds = directors.map((d) => d.id);
        function generateRandomMovietitle() {
            const styles = [
                () => `The ${faker.word.adjective()} ${faker.word.noun()}`,
                () => `${faker.word.noun()} of ${faker.location.city()}`,
                () => `Return of the ${faker.word.noun()}`,
                () => `The ${faker.word.noun()} Chronicles`,
                () => `${faker.person.firstName()}'s ${faker.word.noun()}`,
                () => `${faker.word.verb()} and ${faker.word.verb()}`,
                () => `Escape from ${faker.location.city()}`,
                () =>
                    `A Tale of ${faker.word.adjective()} ${faker.word.noun()}`,
                () => `The Last ${faker.word.noun()}`,
                () => `Beyond the ${faker.word.noun()}`,
                () =>
                    `Legend of the ${faker.word.adjective()} ${faker.word.noun()}`,
                () =>
                    `${faker.word.noun()} in the Time of ${faker.word.noun()}`,
                () => `${faker.word.adjective()} Dreams`,
                () => `The ${faker.word.noun()} Code`,
                () => `My Life as a ${faker.word.noun()}`,
                () =>
                    `When ${faker.person.firstName()} Met ${faker.person.firstName()}`,
                () => `The ${faker.word.noun()} That Could`,
                () => `Nightfall in ${faker.location.city()}`,
                () => `Chronicles of ${faker.person.lastName()}`,
                () => `Finding ${faker.person.firstName()}`,
                () => `${faker.word.adjective()} ${faker.word.noun()} Rising`,
                () => `The Curse of the ${faker.word.noun()}`,
                () => `Welcome to ${faker.location.city()}`,
            ];

            const randomStyle = faker.helpers.arrayElement(styles);
            return randomStyle();
        }

        for (let i = 0; i < 50; i++) {
            movies.push({
                title: generateRandomMovietitle(),
                description: faker.lorem.paragraph(),
                year: faker.number.int({ min: 1920, max: 2025 }),
                duration: faker.number.int({ min: 60, max: 240 }),
                directorId: faker.helpers.arrayElement(directorIds),
                createdAt: new Date(),
                updatedAt: new Date(),
            });
        }

        await queryInterface.bulkInsert("movies", movies, {});
    },

    async down(queryInterface, Sequelize) {
        await queryInterface.bulkDelete("movies", null, {});
    },
};
