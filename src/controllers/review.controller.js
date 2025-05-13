const { Review } = require('../models');

exports.getReviews = async (req, res) => {
    try {
        const reviews = await Review.findByPk(req.params.id);

        return res.status(200).json(reviews);
    } catch (error) {
        console.log(error);
        return res.status(500).json({ message: 'An error occurred while fetching reviews.'})
    }
};

exports.getReview = async (req, res) => {
    try {
        const review = await Review.findByPk(req.params.id);

        if (!review)
            return res.status(404).json({ message: 'Review not found.' });

        return res.status(200).json(review);
    } catch (error) {
        console.log(error);
        return res.status(500).json({ message: 'An error occurred while fetching the review.'})
    }
};

exports.createReview = async (req, res) => {
    const { movieId, content } = req.body;

    if (!movieId || !content)
        return res.status(400).json({ message: 'movieId and content are required.' });

    try {
        const review = await Review.create({
            movieId: req.body.movieId,
            content: req.body.content,
            userId: req.user.id
        });
        res.status(200).json(review);
    } catch (error) {
        console.log(error);
        return res.status(500).json({ message: 'An error occurred while creating the review.'})
    }
    
};

exports.updateReview = async (req, res) => {
    try {
        const review = await Review.findByPk(req.params.id);
        if (!review)
            return res.status(404).json({ message: 'Review not found.' });

        if (review.UserId !== req.user.id)
            return res.status(403).json({ message: 'Forbidden.' });

        review.movieId = req.body.movieId;
        review.content = req.body.content;
        await review.save();

        res.status(200).json(review);
    } catch (error) {
        console.error(error);
        return res.status(500).json({ message: 'An error occurred while updating the review.' });
    }

};

exports.deleteReview = async (req, res) => {
    try {
        const review = await Review.findByPk(req.params.id);

        if (!review)
            return res.status(404).json({ message: 'Review not found.' });

        await review.destroy();
        return res.status(200).json({ message: 'Review deleted successfully.' });
    } catch (error) {
        console.error(error);
        return res.status(500).json({ message: 'An error occurred while deleting the review.' });
    }

}