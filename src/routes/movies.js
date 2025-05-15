const express = require('express');
const router = express.Router();
const movie = require('../controllers/movie.controller');
const { ensureAuth, ensureAdmin } = require('../middlewares/auth.middleware');

// Get all movies
router.get('/', ensureAuth, movie.getMovies);

// Get :id movie
router.get('/:id', ensureAuth, movie.getMovie);

// Create movie [ADMIN ONLY]
router.post('/', ensureAuth, ensureAdmin, movie.createMovie);

// Edit :id movie [ADMIN ONLY]
router.put('/:id', ensureAuth, ensureAdmin, movie.updateMovie);

// Delete :id movie [ADMIN ONLY]
router.delete('/:id', ensureAuth, ensureAdmin, movie.deleteMovie);

// Get :id movie reviews
router.get('/:id/reviews', ensureAuth, movie.getMovieReviews);

// Get :id movie likes
router.get('/:id/likes', ensureAuth, movie.getMovieLikes);

// Add Like to Movie
router.post('/:id/likes', ensureAuth, movie.likeMovie);

// Delete Like from Movie
router.delete('/:id/likes', ensureAuth, movie.unlikeMovie);

module.exports = router;
