'use strict';

const { faker } = require("@faker-js/faker");

module.exports = {
    async up(queryInterface, Sequelize) {
        const users = [];
        const usedGoogleIds = new Set();
        const usedEmails = new Set();
        const roles = [{ weight: 9, value: "user" }, { weight: 1, value: "admin" }];

        function generateUniqueGoogleId() {
            let id;
            do {
                id = faker.string.numeric(21);
            } while (usedGoogleIds.has(id));
            usedGoogleIds.add(id);
            return id;
        }

        function generateUniqueEmail() {
            let email;
            do {
                email = faker.internet.email().toLowerCase();
            } while (usedEmails.has(email));
            usedEmails.add(email);
            return email;
        }

        for (let i = 0; i < 30; i++) {
            users.push({
                googleId: generateUniqueGoogleId(),
                name: faker.person.fullName(),
                email: generateUniqueEmail(),
                profile_picture: faker.image.avatar(),
                role: faker.helpers.weightedArrayElement(roles),
                createdAt: new Date(),
                updatedAt: new Date(),
            });
        }

        await queryInterface.bulkInsert("users", users, {});
    },

    async down(queryInterface, Sequelize) {
        await queryInterface.bulkDelete("users", null, {});
    },
};
