# Netflix OTT PostgreSQL Database

A PostgreSQL database project that simulates the backend database of a Netflix-like OTT platform.

## Features

* User Management
* Video Management
* Genres
* Languages
* Watchlist
* Reviews and Ratings
* Payments
* Subscriptions
* Playback History


## Database Tables

### Core Tables

* users
* video
* genre
* language
* subscription
* payment

### User Activity Tables

* watchlist
* review
* playback_history
* interaction


### Content Tables

* episode
* actor
* director
* movie_actor
* video_language

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

## Author

**Rahul Rathore**

Java Developer | PostgreSQL | Spring Boot | Microservices

GitHub: https://github.com/Rahul21000

Email: [rahulrathore21000@gmail.com](mailto:rahulrathore21000@gmail.com)

---

This project is designed for learning SQL, PostgreSQL, database design, and building OTT platform applications similar to Netflix.
