const passport = require('passport');
const GoogleStrategy = require('passport-google-oauth20').Strategy;
const {User} = require('../models');

passport.serializeUser((user, done) => done(null, user.id));
passport.deserializeUser(async (id, done) => {
    const user = await User.findByPk(id);
    done(null, user);
});

passport.use(new GoogleStrategy({
    clientID: process.env.GOOGLE_CLIENT_ID,
    clientSecret: process.env.GOOGLE_CLIENT_SECRET,
    callbackURL: process.env.GOOGLE_CALLBACK_URL,
}, async (accessToken, refreshToken, profile, done) => {
    console.log("Authenticated User details: ");
    console.log(JSON.stringify(profile, null, 2));
    const [user] = await User.findOrCreate({
        where: { googleId: profile.id },
        defaults: {
            name: profile.displayName,
            email: profile.emails[0].value,
            profile_picture: profile.photos[0].value,
        }
    });
    return done(null, user);
}));

module.exports = passport;
