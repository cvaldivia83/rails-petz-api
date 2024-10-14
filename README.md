#  Rails Petz API
This Ruby on Rails project generates a RESTful API designed for a social media platform dedicated to pets. The API supports interactions with five core tables: **Feed**, **Post**, **Comments**, **Likes**, and **User**. These resources allow users to create, read, update, and delete posts and comments, like posts, and manage user authentication. The API integrates with a Vite front-end, which provides the user interface for the social media experience.

-   **User**: Manages user data and authentication. Each user represents a pet owner, who can post content on behalf of their pets.
-   **Feed**: Displays posts created by users, acting as the main timeline or content stream.
-   **Post**: Allows users to share updates or photos of their pets.
-   **Comments**: Enables users to engage by commenting on posts.
-   **Likes**: Facilitates liking functionality, allowing users to like posts.

Authentication is handled through JWT (JSON Web Tokens) to secure the API, ensuring that users are authenticated when interacting with the platform. The front-end, built with Vite, provides a fast, responsive interface where users can seamlessly browse and interact with the content.

## Specs

*  Ruby version: ruby 3.1.2
* Rails version: rails 7.1.4
* Postgres: 1.2


*  Database creation:

In your terminal, type: ```rails db:create```

*  Database initialization

In your terminal type: ```rails db:migrate```

*  How to run the test suite

On this project I chose to use RSpec for all tests. They can be found inside the folder `/spec`

If you want to run tests for models, type in your terminal: 

```bundle exec rspec spec/models/file_name_spec.rb```

If you want to run tests for controllers, type in your terminal: 

```bundle exec rspec spec/controllers/file_name_spec.rb```

## Endpoints

|Verb| URL  | Action
|--|--|--|
|**POST**  | http://localhost:3001/signup   | User Sign Up|
|**POST**  | http://localhost:3001/login   | User Log In|
| **DEL** | http://localhost:3001/logout | User Log out|
| **GET** | http://localhost:3001/api/v1/feeds/:id | Feed show |
| **POST** | http://localhost:3001/api/v1/posts | Post create |
| **PATCH**| http://localhost:3001/api/v1/posts/:id| Post edit |
| **DEL**| http://localhost:3001/api/v1/posts/:id| Post destroy |
| **GET**| http://localhost:3001/api/v1/comments/:id| Comment show |
| **POST**| http://localhost:3001/api/v1/posts/:post_id/comments| Comment create |
| **DEL**| http://localhost:3001/api/v1/comments/:id| Comment destroy |
|**POST**| http://localhost:3001/api/v1/posts/:post_id/likes | Like create |
| **GET** | http://localhost:3001/api/v1/posts | Post index|
| **GET**| http://localhost:3001/api/v1/user | Get user|
| **GET**| http://localhost:3001/api/v1/user/validate_token| Validate Token|
