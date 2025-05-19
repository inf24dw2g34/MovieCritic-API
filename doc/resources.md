# API Resources

Description of the main resources in the MovieCritic API, including their fields, relationships, endpoints, and data deletion behavior.

---

## User

**Fields:**
- `id`: integer
- `name`: string
- `profile_picture`: string
- `role`: string (`user` or `admin`)
- `createdAt`: datetime
- `updatedAt`: datetime

**Relationships:**
- **One-to-Many:** User has many Reviews
- **Many-to-Many:** User likes many Movies (Likes)

**Endpoints:**
- `GET /users` — List all users (admin only)
- `GET /users/{id}` — Get user by ID
- `PATCH /users/{id}` — Update user
- `DELETE /users/{id}` — Delete user
- `GET /users/{id}/reviews` — Get all reviews by user
- `GET /users/{id}/likes` — Get all movies liked by user

---

## Movie

**Fields:**
- `id`: integer
- `title`: string
- `description`: string
- `year`: integer
- `duration`: integer (minutes)
- `directorId`: integer
- `createdAt`: datetime
- `updatedAt`: datetime

**Relationships:**
- **Many-to-One:** Movie belongs to Director
- **One-to-Many:** Movie has many Reviews
- **Many-to-Many:** Movie liked by many Users (Likes)

**Endpoints:**
- `GET /movies` — List all movies
- `GET /movies/{id}` — Get movie by ID
- `POST /movies` — Create a new movie (admin only)
- `PUT /movies/{id}` — Update a movie (admin only)
- `DELETE /movies/{id}` — Delete a movie (admin only)
- `GET /movies/{id}/reviews` — Get all reviews for a movie
- `GET /movies/{id}/likes` — Get all users who liked a movie
- `POST /movies/{id}/likes` — Like a movie
- `DELETE /movies/{id}/likes` — Unlike a movie

---

## Review

**Fields:**
- `id`: integer
- `content`: string
- `rating`: integer (1-5)
- `userId`: integer
- `movieId`: integer
- `createdAt`: datetime
- `updatedAt`: datetime

**Relationships:**
- **Many-to-One:** Review belongs to User
- **Many-to-One:** Review belongs to Movie

**Endpoints:**
- `GET /reviews` — List all reviews by the authenticated user
- `POST /reviews` — Create a new review
- `GET /reviews/{id}` — Get review by ID
- `PUT /reviews/{id}` — Update a review
- `DELETE /reviews/{id}` — Delete a review

---

## Director

**Fields:**
- `id`: integer
- `name`: string
- `createdAt`: datetime
- `updatedAt`: datetime

**Relationships:**
- **One-to-Many:** Director has many Movies

**Endpoints:**
- `GET /directors` — List all directors
- `GET /directors/{id}` — Get director by ID
- `POST /directors` — Create a new director (admin only)
- `PUT /directors/{id}` — Update a director (admin only)
- `DELETE /directors/{id}` — Delete a director (admin only)

---

## Data Deletion Behavior

- **Deleting a Director:**  
  The director will be removed, but their movies will remain in the database. Movies directed by the deleted director will not be deleted or reassigned automatically.

- **Deleting a Movie:**  
  The movie will be removed, and all associated reviews and likes for that movie will also be deleted.

- **Deleting a User:**  
  The user will be removed, and all their likes will be deleted. However, their reviews will remain in the database and will not be deleted.

---

## Authentication

- **Google OAuth 2.0** is used for user authentication.

**Endpoints:**
- `GET /auth/google` — Start Google OAuth login
- `GET /auth/google/callback` — Google OAuth callback
- `GET /auth/logout` — Logout the user

---
