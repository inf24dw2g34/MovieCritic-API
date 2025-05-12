const express = require('express');
const router = express.Router();
const Review = require('../models/Review');
const Like = require('../models/Like');
const User = require('../models/User');

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
    status: 'error',
    message: 'Not Authenticated',
  });
}

// Create review
router.post('/', ensureAuth, async (req, res) => {
  const review = await Review.create({
    movieTitle: req.body.movieTitle,
    content: req.body.content,
    userId: req.user.id
  });
  res.json(review);
});

// Edit own review
router.put('/:id', ensureAuth, async (req, res) => {
  const review = await Review.findByPk(req.params.id);
  if (!review || review.UserId !== req.user.id)
    return res.status(403).json({
      status: 'error',
      message: 'Forbidden',
    });

  review.movieTitle = req.body.movieTitle;
  review.content = req.body.content;
  await review.save();

  res.json(review);
});

// Like review
router.post('/:id/like', ensureAuth, async (req, res) => {
  const review = await Review.findByPk(req.params.id);
  if (!review || review.UserId === req.user.id) return res.status(400).send('Invalid');

  await review.addLiker(req.user); // through Like model
  res.send('Liked');
});

// Get all reviews
router.get('/', async (req, res) => {
  const reviews = await Review.findAll({ include: User });
  res.json(reviews);
});

module.exports = router;
