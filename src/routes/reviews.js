const express = require('express');
const router = express.Router();
const {Review} = require('../models')
const review = require('../controllers/review.controller');

/*
function ensureAdmin(req, res, next) {
    if (req.user && req.user.role === 'admin') {
        return next();
    }
    res.status(403).send('Forbidden: Admins only');
}
*/

function ensureAuth(req, res, next) {
  if (req.isAuthenticated()) return next();
  res.status(401).json({
    message: 'Not Authenticated',
  });
}

// Get all reviews
router.get('/', ensureAuth, review.getReviews);

// Get :id review
router.get('/:id', review.getReview);

// Create review
router.post('/', ensureAuth, review.createReview);

// Edit :id review
router.put('/:id', ensureAuth, review.updateReview);

// Delete :id review
router.delete('/:id', ensureAuth, review.deleteReview);

module.exports = router;
