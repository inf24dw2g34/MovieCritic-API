const { Director, Movie } = require("../models");
const MOVIE_ATTRIBUTES = ["id", "title", "description", "year", "duration"];

exports.getDirectors = async (req, res) => {
    try {
        const directors = await Director.findAll();

        return res.status(200).json(directors);
    } catch (error) {
        console.error(error);
        return res
            .status(500)
            .json({ message: "An error occurred while fetching Directors." });
    }
};

exports.getDirector = async (req, res) => {
    try {
        const director = await Director.findByPk(req.params.id);

        if (!director)
            return res.status(404).json({ message: "Director not found." });

        return res.status(200).json(director);
    } catch (error) {
        console.error(error);
        return res
            .status(500)
            .json({
                message: "An error occurred while fetching the Director.",
            });
    }
};

exports.createDirector = async (req, res) => {
    const { name } = req.body;

    if (!name) return res.status(400).json({ message: "name is required." });

    try {
        const director = await Director.create({ name });
        return res.status(201).json(director);
    } catch (error) {
        console.error(error);
        return res
            .status(500)
            .json({
                message: "An error occurred while creating the Director.",
            });
    }
};

exports.updateDirector = async (req, res) => {
    try {
        const { name } = req.body;
        if (!name)
            return res.status(400).json({ message: "'name' is required." });

        const director = await Director.findByPk(req.params.id);
        if (!director)
            return res.status(404).json({ message: "Director not found." });

        director.name = name;
        await director.save();

        return res.status(200).json(director);
    } catch (error) {
        console.error(error);
        return res
            .status(500)
            .json({
                message: "An error occurred while updating the Director.",
            });
    }
};

exports.deleteDirector = async (req, res) => {
    try {
        const director = await Director.findByPk(req.params.id);

        if (!director)
            return res.status(404).json({ message: "Director not found." });

        await director.destroy();
        return res
            .status(200)
            .json({ message: "Director deleted successfully." });
    } catch (error) {
        console.error(error);
        return res
            .status(500)
            .json({
                message: "An error occurred while deleting the Director.",
            });
    }
};

exports.getDirectorMovies = async (req, res) => {
    try {
        const director = await Director.findByPk(req.params.id, {
            include: [
                {
                    model: Movie,
                    exclude: ["directorId"]
                }
            ]
        });

        if (!director)
            return res.status(404).json({ message: "Director not found." });

        return res.status(200).json(director.Movies);
    } catch (error) {
        console.error(error);
        return res
            .status(500)
            .json({
                message: "An error occurred while fetching the Director.",
            });
    }
};
