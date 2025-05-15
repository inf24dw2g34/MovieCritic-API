const express = require('express');
const router = express.Router();
const review = require('../controllers/review.controller');
const { ensureAuth } = require('../middlewares/auth.middleware');

// Get all reviews
router.get('/', ensureAuth, review.getReviews);

// Get :id review
router.get('/:id', ensureAuth, review.getReview);

// Create review
router.post('/', ensureAuth, review.createReview);

// Edit :id review
router.put('/:id', ensureAuth, review.updateReview);

// Delete :id review
router.delete('/:id', ensureAuth, review.deleteReview);

module.exports = router;
