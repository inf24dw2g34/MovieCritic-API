'use strict';

/** @type {import('sequelize-cli').Migration} */
module.exports = {
  async up(queryInterface, Sequelize) {
    await queryInterface.addColumn('users', 'profile_picture', {
      type: Sequelize.STRING,
      allowNull: true,
      defaultValue: null,
      after: 'email'
    });

  },

  async down(queryInterface, Sequelize) {
    await queryInterface.removeColumn('users', 'profile_picture');
  }
};
