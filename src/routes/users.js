const express = require("express");
const router = express.Router();
const user = require("../controllers/user.controller");
const { ensureAuth, ensureAdmin } = require("../middlewares/auth.middleware");

// Get all users
router.get("/", ensureAuth, ensureAdmin, user.getUsers);

// Get authenticated User
router.get("/me", ensureAuth, user.getMe);

// Get :id user
router.get("/:id", ensureAuth, user.getUser);

// Edit :id user
router.patch("/:id", ensureAuth, user.updateUser);

// Delete :id user
router.delete("/:id", ensureAuth, ensureAdmin, user.deleteUser);

// Get :id user Reviews
router.get("/:id/reviews", ensureAuth, user.getUserReviews);

// Get :id user likes
router.get("/:id/likes", ensureAuth, user.getUserLikes);

module.exports = router;
