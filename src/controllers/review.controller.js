const { Review, Movie, User } = require("../models");
const MOVIE_ATTRIBUTES = ["id", "title", "description", "year", "duration"];

exports.getReviews = async (req, res) => {
    try {
        const reviews = await Review.findAll({
            where: {
                userId: req.user.id,
            },
            attributes: { exclude: ["movieId"] },
            include: [
                {
                    model: Movie,
                    attributes: MOVIE_ATTRIBUTES,
                },
            ],
        });

        return res.status(200).json(reviews);
    } catch (error) {
        console.error(error);
        return res
            .status(500)
            .json({ message: "An error occurred while fetching Reviews." });
    }
};

exports.getReview = async (req, res) => {
    try {
        const review = await Review.findByPk(req.params.id, {
            attributes: { exclude: ["userId", "movieId"] },
            include: [
                {
                    model: Movie,
                    attributes: MOVIE_ATTRIBUTES,
                },
                {
                    model: User,
                    attributes:
                        req.user?.role === "admin"
                            ? { exclude: [] }
                            : ["id", "name", "profile_picture"],
                },
            ],
        });

        if (!review)
            return res.status(404).json({ message: "Review not found." });

        return res.status(200).json(review);
    } catch (error) {
        console.error(error);
        return res
            .status(500)
            .json({ message: "An error occurred while fetching the Review." });
    }
};

exports.createReview = async (req, res) => {
    const { content, rating, movieId } = req.body;

    if (!content || !movieId)
        return res
            .status(400)
            .json({ message: "content and movieId are required." });

    if (rating < 1 || rating > 5)
        return res
            .status(400)
            .json({ message: "Rating must be between 1 and 5." });
    try {
        const existingReview = await Review.findOne({
            where: {
                userId: req.user.id,
                movieId: movieId,
            },
        });

        if (existingReview)
            return res.status(400).json({
                message: "Review already exists for this user and movie.",
            });

        const review = await Review.create({
            content,
            rating: rating || null, //optional
            movieId,
            userId: req.user.id,
        });
        return res.status(201).json(review);
    } catch (error) {
        console.error(error);
        return res
            .status(500)
            .json({ message: "An error occurred while creating the Review." });
    }
};

exports.updateReview = async (req, res) => {
    try {
        const { content, rating } = req.body;
        if (!content)
            return res.status(400).json({ message: "'content' is required." });

        if (rating !== undefined && (rating < 1 || rating > 5)) {
            return res
                .status(400)
                .json({ message: "Rating must be between 1 and 5." });
        }

        const review = await Review.findByPk(req.params.id);
        if (!review)
            return res.status(404).json({ message: "Review not found." });

        if (review.userId !== req.user.id && req.user?.role !== "admin")
            return res
                .status(403)
                .json({ message: "Forbidden: Not Authorized" });

        review.content = content;
        review.rating = rating;
        await review.save();

        return res.status(200).json(review);
    } catch (error) {
        console.error(error);
        return res
            .status(500)
            .json({ message: "An error occurred while updating the Review." });
    }
};

exports.deleteReview = async (req, res) => {
    try {
        const review = await Review.findByPk(req.params.id);

        if (!review)
            return res.status(404).json({ message: "Review not found." });

        if (review.userId !== req.user.id && req.user?.role !== "admin")
            return res
                .status(403)
                .json({ message: "Forbidden: Not Authorized" });

        await review.destroy();
        return res
            .status(200)
            .json({ message: "Review deleted successfully." });
    } catch (error) {
        console.error(error);
        return res
            .status(500)
            .json({ message: "An error occurred while deleting the Review." });
    }
};
