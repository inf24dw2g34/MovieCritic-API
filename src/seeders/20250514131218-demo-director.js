'use strict';

const { faker } = require("@faker-js/faker");

module.exports = {
    async up(queryInterface, Sequelize) {
        const directors = [];
        for (let i = 0; i < 30; i++) {
            directors.push({
                name: faker.person.fullName(),
                createdAt: new Date(),
                updatedAt: new Date(),
            });
        }

        await queryInterface.bulkInsert("directors", directors, {});
    },

    async down(queryInterface, Sequelize) {
         await queryInterface.bulkDelete('directors', null, {});
    },
};
