const { Movie, User } = require("../models");

const MOVIE_ATTRIBUTES = ["id", "title", "description", "year", "duration"];

const getReviewQueryOptions = (user) => ({
    attributes: { exclude: ["userId", "movieId"] },
    include: [
        {
            model: Movie,
            attributes: MOVIE_ATTRIBUTES,
        },
        {
            model: User,
            attributes: user?.role === "admin"
                ? { exclude: [] }
                : ["id", "name", "profile_picture"],
        },
    ],
});

module.exports = { getReviewQueryOptions };
