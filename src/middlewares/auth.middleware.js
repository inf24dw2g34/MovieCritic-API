function ensureAuth(req, res, next) {
    if (req.isAuthenticated()) return next();
    res.status(401).json({
        message: "Forbidden: Not Authenticated",
    });
}

function ensureAdmin(req, res, next) {
    if (req.user?.role === "admin") return next();
    res.status(403).json({
        message: "Forbidden: Admins only",
    });
}

module.exports = {
    ensureAuth,
    ensureAdmin,
};
