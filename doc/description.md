# MovieCritic API

## Introduction

MovieCritic API is a RESTful web service designed to manage and share movie reviews. It enables users to authenticate, review movies, like their favorites, and manage movie-related data.

## What Does the API Offer?

- **User Authentication:**  
  Secure login using Google OAuth 2.0, supporting both regular users and admin roles.

- **Movie Management:**  
  Create, read, update, and delete movies. Each movie can have a director, reviews, and likes.

- **Review System:**  
  Users can write, edit, and delete reviews for movies, sharing their opinions and ratings.

- **Likes:**  
  Users can like or unlike movies, helping to highlight popular choices.

- **Director Management:**  
  Admins can manage directors and associate them with movies.

- **Role-Based Access:**  
  Certain actions (like deleting movies or directors) are restricted to admin users.

- **Documentation:**  
  Interactive API docs are available via Swagger UI at `/docs`.

- **Seeders:**  
  The project includes database seeders to populate the database with initial data (such as users, movies, directors, and reviews).

## How Does It Work?

- Built with Node.js, Express, and Sequelize (for MySQL).
- Authentication is handled via Google OAuth 2.0 using Passport.js.
- All data is stored in a MySQL database running in a Docker container.
- The API is documented and testable through Swagger UI.
- Database seeders are available for quick setup and testing.

## Where to Start?

1. **Read the [Installation Guide](../README.md#installation)** for setup and technical details.
2. **Check the [API Resources](./resources.md)** for details on available endpoints and data models.
3. **Explore the API documentation** at `/docs` after running the project.

---
