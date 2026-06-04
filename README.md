#OTT PostgreSQL Database
                       
A PostgreSQL database project that simulates the backend database of a Netflix-like OTT platform.

## Features

* User Management
* Genres
* Languages
* Watchlist
* Reviews and Ratings
* Payments
* Subscriptions


## Database Tables

### Core Tables

* users
* profile
* content
* genre
* language
* subscription
* subscription_plan
* payment

### User Activity Tables

* watchlist
* review
  

## Technologies Used

* PostgreSQL
* SQL
* pgAdmin

## Sample Data

The project contains sample data for:

* Users
* Movies
* Genres
* Languages
* Reviews
* Payments
* Watchlists

## Example Queries

### Show all users

```sql
SELECT * FROM users;
```

### Show all videos

```sql
SELECT * FROM video;
```

### Show movies with genres

```sql
SELECT
    v.video_title,
    g.genre_name
FROM video v
JOIN genre g
ON v.genre_id = g.genre_id;
```

### Show user reviews

```sql
SELECT
    u.user_name,
    v.video_title,
    r.rating,
    r.comment
FROM review r
JOIN users u
ON r.user_id = u.user_id
JOIN video v
ON r.video_id = v.video_id;
```

## Project Structure

```ott-postgresql-database
│
├── README.md
├── schema.sql
├── sample_data.sql
├── queries.sql
└── ER_Diagram.png
```
  +-------------+
                           |    Genre    |
                           +-------------+
                           | genre_id PK |
                           | genre_name  |
                           +-------------+
                                  |
                                  | 1:M
                                  |
                           +-------------+
                           |    Video    |
                           +-------------+
                           | video_id PK |
                           | video_title |
                           | release_year|
                           | genre_id FK |
                           +-------------+
                            /      |      \
                           /       |       \
                          /        |        \
                         /         |         \
                        /          |          \
                +---------+  +-----------+  +-------------+
                | Review  |  | Watchlist |  | PlaybackHist|
                +---------+  +-----------+  +-------------+
                |review_id|  |watchlist_id| |history_id PK|
                |user_id FK| |user_id FK | |user_id FK   |
                |video_id FK| |video_id FK| |video_id FK  |
                |rating    | |           | |playback_date |
                |comment   | +-----------+ +-------------+
                +---------+
                      |
                      |
                      | M:1
                      |
                +-------------+
                |    Users    |
                +-------------+
                | user_id PK  |
                | user_name   |
                | user_email  |
                | subscription|
                +-------------+
                   /      \
                  /        \
                 /          \
                /            \
        +-------------+   +-------------+
        | Subscription|   |   Payment   |
        +-------------+   +-------------+
        |sub_id PK    |   |payment_id PK|
        |user_id FK   |   |user_id FK   |
        |plan         |   |amount       |
        +-------------+   +-------------+


            +-------------+
            |  Language   |
            +-------------+
            |language_id PK|
            |language_name |
            +-------------+
                   |
                   | M:M
                   |
          +------------------+
          | Video_Language   |
          +------------------+
          | video_id FK      |
          | language_id FK   |
          +------------------+
                   |
                   |
                   M
                   |
            +-------------+
            |    Video    |
            +-------------+


            +-------------+
            |    Actor    |
            +-------------+
            | actor_id PK |
            | actor_name  |
            +-------------+
                   |
                   | M:M
                   |
          +----------------+
          |  Movie_Actor   |
          +----------------+
          | video_id FK    |
          | actor_id FK    |
          +----------------+
                   |
                   |
                   M
                   |
            +-------------+
            |    Video    |
            +-------------+

## Author

**Rahul Rathore**

Java Developer | PostgreSQL | Spring Boot | Microservices

GitHub: https://github.com/Rahul21000

Email: [rahulrathore21000@gmail.com](mailto:rahulrathore21000@gmail.com)

---

This project is designed for learning SQL, PostgreSQL, database design, and building OTT platform applications similar to Netflix.
