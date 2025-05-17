const { User, Review, Movie } = require("../models");

exports.getUsers = async (req, res) => {
    try {
        const users = await User.findAll();
        return res.status(200).json(users);
    } catch (error) {
        console.error(error);
        return res
            .status(500)
            .json({ message: "An error occurred while fetching Users." });
    }
};

exports.getMe = async (req, res) => {
    try {
        const attributes =
            req.user?.role === "admin"
                ? undefined
                : ["id", "name", "email", "profile_picture"];
        const user = await User.findByPk(req.user.id, {
            attributes: attributes,
        });

        if (!user) return res.status(404).json({ message: "User not found." });

        return res.status(200).json(user);
    } catch (error) {
        console.error(error);
        return res
            .status(500)
            .json({ message: "An error occurred while fetching User." });
    }
};

exports.getUser = async (req, res) => {
    try {
        const attributes =
            req.user?.role === "admin"
                ? undefined
                : ["id", "name", "profile_picture"];
        const user = await User.findByPk(req.params.id, {
            attributes: attributes,
        });

        if (!user) return res.status(404).json({ message: "User not found." });

        return res.status(200).json(user);
    } catch (error) {
        console.error(error);
        return res
            .status(500)
            .json({ message: "An error occurred while fetching User." });
    }
};

exports.updateUser = async (req, res) => {
    const { name, profile_picture, role } = req.body;
    const userId = req.params.id;
    const currentUser = req.user;

    if (currentUser.id !== Number(userId) && currentUser.role !== "admin") {
        return res.status(403).json({ message: "Forbidden" });
    }

    try {
        const user = await User.findByPk(userId);
        if (!user) return res.status(404).json({ message: "User not found." });

        if (name !== undefined) user.name = name;
        if (profile_picture !== undefined)
            user.profile_picture = profile_picture;
        if (role !== undefined && currentUser.role === "admin") {
            if (!["admin", "user"].includes(role)) {
                return res.status(400).json({
                    message: "Role must be either 'admin' or 'user'.",
                });
            }
            user.role = role;
        } else if (role !== undefined) {
            return res.status(403).json({ message: "Forbidden" });
        }

        await user.save();

        const safeUser =
            currentUser.role === "admin"
                ? user
                : {
                    id: user.id,
                    name: user.name,
                    profile_picture: user.profile_picture,
                };

        return res.status(200).json(safeUser);
    } catch (error) {
        console.error(error);
        return res
            .status(500)
            .json({ message: "An error occurred while updating the User." });
    }
};

exports.deleteUser = async (req, res) => {
    const userId = req.params.id;

    try {
        const user = await User.findByPk(userId);
        if (!user) return res.status(404).json({ message: "User not found." });

        await user.destroy();
        return res.status(200).json({ message: "User deleted successfully." });
    } catch (error) {
        console.error(error);
        return res
            .status(500)
            .json({ message: "An error occurred while deleting the User." });
    }
};

exports.getUserReviews = async (req, res) => {
    try {
        const user = await User.findByPk(req.params.id, {
            include: [
                {
                    model: Review,
                    attributes: ["id", "content", "rating", "createdAt"],
                    include: [
                        {
                            model: Movie,
                            attributes: ["id", "title", "year", "duration"],
                        },
                    ],
                },
            ],
        });

        if (!user) return res.status(404).json({ message: "User not found." });

        return res.status(200).json(user.Reviews);
    } catch (error) {
        console.error(error);
        return res.status(500).json({
            message: "An error occurred while fetching User Reviews.",
        });
    }
};

exports.getUserLikes = async (req, res) => {
    try {
        const user = await User.findByPk(req.params.id, {
            include: [
                {
                    model: Movie,
                    as: "Likes",
                    through: { attributes: [] },
                    attributes: ["id", "title", "year", "duration"],
                },
            ],
        });

        if (!user) return res.status(404).json({ message: "User not found." });

        return res.status(200).json(user.Likes);
    } catch (error) {
        console.error(error);
        return res
            .status(500)
            .json({ message: "An error occurred while fetching User Likes." });
    }
};
