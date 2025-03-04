# README

# 🏗️ My API - Movie Management API

## 🚀 Task - What is the problem? And where is the challenge?
The goal of this project is to build a RESTful API using Ruby on Rails that allows users to manage a collection of movies. The API should support the following features:

    - Fetch all movies
    - Fetch a movie by ID
    - Create a new user
    - User authentication with Doorkeeper
    - Create, update, and delete movies (restricted to authenticated users)

### 🎯 My Challenge
- Authentication: We initially considered Devise JWT, but we chose Doorkeeper for OAuth2 authentication.
- Caching with Redis: Implemented Redis caching for optimized API performance.
- Deployment Issues on Render:
    * Render’s free plan does not allow shell access, meaning authentication-based actions (sign in, create, update, delete movies) cannot be tested online.
    * However, you can still test these actions locally via Postman.

## 🔧 Description - How we solved the problem?
We structured the API using Ruby on Rails and followed best practices:
    - Authentication: Implemented Doorkeeper for secure OAuth2 authentication.
    - Database Management: Used PostgreSQL as the primary database.
    - Caching Optimization: Integrated Redis to speed up responses.
    - Pagination: Used Kaminari to paginate movie lists.
    - Testing: API routes were tested using Postman locally before deployment.

## 💻 Installation Guide
1. Clone the Repository

$ git clone https://github.com/ibnmajahbilly/my_api.git
$ cd my_api

2. Install Dependencies
Ensure you have Ruby and Bundler installed, then run:
$ bundle install

3. Setup the Database

$ rails db:create
$ rails db:migrate

4. Start the Server

$ rails s

For local host
The API will be available at: http://localhost:3000
For online or render
https://my-api-kuzh.onrender.com

For Postman Documentation
https://documenter.getpostman.com/view/42713171/2sAYdkFTbu

## Usage TODO - How does it work?
Online Testing (Limited Features Due to Free Render Plan)

The deployed API on Render supports the following endpoints:
    - Fetch all movies: GET /movies
    - Fetch movie by ID: GET /movies/:id (Replace 123 with an actual ID)
    - Create user: POST /users

❌ What You CANNOT Do Online (Due to Render Limitations)
    - Sign in
    - Create a movie
    - Update a movie
    - Delete a movie
These actions require shell access, which is restricted in Render's free plan. You can test them locally using Postman.

Local Testing (Full Features Available)
When running locally, you can use Postman or cURL to test all features.

Authentication

- Sign Up (Create User)
    POST http://localhost:3000/users
Body:
{
  "user": {
    "name": "Ibnmajah",
    "email": "ibnmajah@gmail.com",
    "password": "123456"
  }
}

- Sign In (Get Access Token)
    POST http://localhost:3000/oauth/token
Body:
{
  "grant_type": "password",
  "email": "ibnmajah@gmail.com",
  "password": "123456"
}

- Create Movie (Authenticated)
    POST http://localhost:3000/movies
Headers: { "Authorization": "Bearer ACCESS_TOKEN" }
Body:
{
  "movie": {
    "title": "Inception",
    "description": "A mind-bending thriller",
    "genre": "Sci-Fi",
    "release_year": 2010,
    "director": "Christopher Nolan"
  }
}

- Update Movie (Authenticated)
    PUT http://localhost:3000/movies/1
Headers: { "Authorization": "Bearer ACCESS_TOKEN" }
Body:
{
  "movie": {
    "title": "Inception Updated"
  }
}

- Delete Movie (Authenticated)
    DELETE http://localhost:3000/movies/1
Headers: { "Authorization": "Bearer ACCESS_TOKEN" }

## Final Notes for the Reviewer

The online Render deployment only allows fetching movies and creating users.

To test authentication and movie management, please run the project locally.

This API was built with Doorkeeper, Redis, Kaminari, and PostgreSQL for scalability.

🚀 Thank you for reviewing my project! Let me know if you need further clarification.

### The Core Team
IBRAHIM SANI IBRAHIM
Software Developer
Contact: lambairoro@gmail.com