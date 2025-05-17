module.exports = {
  openapi: '3.0.0',
  info: {
    title: 'Movie Critic API',
    version: '1.0.0',
    description: 'API documentation for my Node.js app with Google OAuth2',
  },
  servers: [
    {
      url: `http://localhost:3000`,
      description: 'Local server',
    },
  ],
  components: {
    securitySchemes: {
      googleOAuth: {
        type: 'oauth2',
        flows: {
          authorizationCode: {
            authorizationUrl: 'https://accounts.google.com/o/oauth2/auth',
            tokenUrl: 'https://oauth2.googleapis.com/token',
            scopes: {
              email: 'Email access',
              profile: 'Profile access',
            },
          },
        },
      },
    },
  },
  security: [
    {
      googleOAuth: ['email', 'profile'],
    },
  ],
  tags: [
    {
      name: 'General',
      description: 'General endpoints',
    },
    {
      name: 'Authentication',
      description: 'Endpoints for user authentication',
    },
    {
      name: 'Directors',
      description: 'Endpoints for director management',
    },
    {
      name: 'Movies',
      description: 'Endpoints for movie management',
    },
    {
      name: 'Reviews',
      description: 'Endpoints for review management',
    },
    {
      name: 'Users',
      description: 'Endpoints for user management',
    },
  ],
};
