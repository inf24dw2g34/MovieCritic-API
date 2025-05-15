const express = require('express');
const router = express.Router();
const director = require('../controllers/director.controller');
const { ensureAuth, ensureAdmin } = require('../middlewares/auth.middleware');

// Get all directors
router.get('/', ensureAuth, director.getDirectors);

// Get :id director
router.get('/:id', ensureAuth, director.getDirector);

// Create director
router.post('/', ensureAuth, ensureAdmin, director.createDirector);

// Edit :id director
router.put('/:id', ensureAuth, ensureAdmin, director.updateDirector);

// Delete :id director
router.delete('/:id', ensureAuth, ensureAdmin, director.deleteDirector);

// Get :id director's movies
router.get('/:id/movies', ensureAuth, director.getDirectorMovies);

module.exports = router;
