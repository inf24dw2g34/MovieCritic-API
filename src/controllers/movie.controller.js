const { Movie, Director, Review, User } = require("../models");

exports.getMovies = async (req, res) => {
    try {
        const movies = await Movie.findAll({
            attributes: { exclude: ["directorId"] },
            include: [
                {
                    model: Director,
                },
            ],
        });

        return res.status(200).json(movies);
    } catch (error) {
        console.error(error);
        return res
            .status(500)
            .json({ message: "An error occurred while fetching Movies." });
    }
};

exports.getMovie = async (req, res) => {
    try {
        const movie = await Movie.findByPk(req.params.id, {
            attributes: { exclude: ["directorId"] },
            include: [
                {
                    model: Director,
                },
            ],
        });

        if (!movie)
            return res.status(404).json({ message: "Movie not found." });

        return res.status(200).json(movie);
    } catch (error) {
        console.error(error);
        return res
            .status(500)
            .json({ message: "An error occurred while fetching the Movie." });
    }
};

exports.createMovie = async (req, res) => {
    const { title, description, year, duration, directorId } = req.body;

    if (!title || !description || !year || !duration)
        return res.status(400).json({
            message: "title, description, year and duration are required.",
        });
    try {
        const movie = await Movie.create({
            title,
            description,
            year,
            duration,
            directorId: directorId || null, //optional
        });
        return res.status(201).json(movie);
    } catch (error) {
        console.error(error);
        return res
            .status(500)
            .json({ message: "An error occurred while creating the Movie." });
    }
};

exports.updateMovie = async (req, res) => {
    const { title, description, year, duration, directorId } = req.body;

    try {
        if (!title || !description || !year || !duration)
            return res.status(400).json({
                message: "title, description, year and duration are required.",
            });

        const movie = await Movie.findByPk(req.params.id);
        if (!movie)
            return res.status(404).json({ message: "Movie not found." });

        Object.assign(movie, {
            title,
            description,
            year,
            duration,
            directorId: directorId || null,
        });
        await movie.save();

        return res.status(200).json(movie);
    } catch (error) {
        console.error(error);
        return res
            .status(500)
            .json({ message: "An error occurred while updating the Movie." });
    }
};

exports.deleteMovie = async (req, res) => {
    try {
        const movie = await Movie.findByPk(req.params.id);

        if (!movie)
            return res.status(404).json({ message: "Movie not found." });

        await movie.destroy();
        return res.status(200).json({ message: "Movie deleted successfully." });
    } catch (error) {
        console.error(error);
        return res
            .status(500)
            .json({ message: "An error occurred while deleting the Movie." });
    }
};

exports.getMovieReviews = async (req, res) => {
    try {
        const movie = await Movie.findByPk(req.params.id, {
            include: [
                {
                    model: Review,
                    attributes: ["id", "content", "rating"],
                    include: [
                        {
                            model: User,
                            attributes: ["id", "name", "profile_picture"],
                        },
                    ],
                },
            ],
        });

        if (!movie)
            return res.status(404).json({ message: "Movie not found." });

        return res.status(200).json(movie.Reviews);
    } catch (error) {
        console.error(error);
        return res
            .status(500)
            .json({ message: "An error occurred while fetching the Movie." });
    }
};

exports.getMovieLikes = async (req, res) => {
    try {
        const movie = await Movie.findByPk(req.params.id, {
            include: [
                {
                    model: User,
                    through: { attributes: [] },
                    as: "Likes",
                    attributes: ["id", "name", "profile_picture"],
                },
            ],
        });

        if (!movie) {
            return res.status(404).json({ message: "Movie not found." });
        }

        return res.status(200).json(movie.Likes);
    } catch (error) {
        console.error(error);
        return res.status(500).json({
            message: "An error occurred while fetching the Movie likes.",
        });
    }
};

exports.likeMovie = async (req, res) => {
    const userId = req.user.id;
    const movieId = req.params.id;

    try {
        const movie = await Movie.findByPk(movieId);
        if (!movie) return res.status(404).json({ message: "Movie not found" });

        const liked = await movie.hasLike(userId);
        if (liked) 
            return res.status(409).json({ message: "Movie already liked" });
        
        await movie.addLike(userId);
        return res.status(201).json({ message: "Movie liked" });
    } catch (err) {
        console.error(err);
        return res.status(500).json({ message: "Error liking movie" });
    }
};

exports.unlikeMovie = async (req, res) => {
    const userId = req.user.id;
    const movieId = req.params.id;

    try {
        const movie = await Movie.findByPk(movieId);
        if (!movie) return res.status(404).json({ message: "Movie not found" });

        const liked = await movie.hasLike(userId);
        if (!liked) 
            return res.status(409).json({ message: "Movie was not liked" });

        await movie.removeLike(userId);
        return res.status(200).json({ message: "Movie unliked" });
    } catch (err) {
        console.error(err);
        return res.status(500).json({ message: "Error unliking movie" });
    }
};
