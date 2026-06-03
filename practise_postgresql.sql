
-- OTT_Database Schema



CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    user_name VARCHAR(100),
    user_email VARCHAR(100) UNIQUE,
    user_subscription VARCHAR(20)
);

-- User Data

INSERT INTO users (user_name, user_email, user_subscription)
VALUES
('User1', 'user1@gmail.com', 'Premium'),
('User2', 'user2@gmail.com', 'Premium'),
('User3', 'user3@gmail.com', 'Premium'),
('User4', 'user4@gmail.com', 'Premium'),
('User5', 'user5@gmail.com', 'Premium'),
('User6', 'user6@gmail.com', 'Premium'),
('User7', 'user7@gmail.com', 'Premium'),
('User8', 'user8@gmail.com', 'Premium'),
('User9', 'user9@gmail.com', 'Premium'),
('User10', 'user10@gmail.com', 'Premium'),
('User11', 'user11@gmail.com', 'Premium'),
('User12', 'user12@gmail.com', 'Premium'),
('User13', 'user13@gmail.com', 'Premium'),
('User14', 'user14@gmail.com', 'Premium'),
('User15', 'user15@gmail.com', 'Premium');

SELECT * FROM users;

CREATE TABLE genre (
    genre_id SERIAL PRIMARY KEY,
    genre_name VARCHAR(50)
);

INSERT INTO genre(genre_name) VALUES
('Action'),('Comedy'),('Drama'),('Sci-Fi'),('Horror');

SELECT * FROM genre;


CREATE TABLE video (
    video_id SERIAL PRIMARY KEY,
    video_title VARCHAR(255),
    genre_id INT REFERENCES genre(genre_id),
    release_year INT
);


INSERT INTO video (video_title, genre_id, release_year)
VALUES
('Avengers: Endgame',1,2019),
('Interstellar',4,2014),
('The Dark Knight',1,2008),
('Joker',3,2019),
('The Conjuring',5,2013);

SELECT * FROM video 

--Show videos with their genre names

SELECT
    v.video_id,
    v.video_title,
    g.genre_name,
    v.release_year
FROM video v
JOIN genre g
ON v.genre_id = g.genre_id;

CREATE TABLE watchlist (
    watchlist_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(user_id),
    video_id INT REFERENCES video(video_id)
);

INSERT INTO watchlist(user_id, video_id)
VALUES
(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,6),
(7,7),
(8,8),
(9,9),
(10,10),
(11,11),
(12,12),
(13,13),
(14,14),
(15,15),
(1,16),
(2,17),
(3,18),
(4,19),
(5,20);

SELECT * FROM watchlist;

--To display user names along with movie titles

SELECT
    u.user_name,
    v.video_title
FROM watchlist w
JOIN users u
    ON w.user_id = u.user_id
JOIN video v
    ON w.video_id = v.video_id;


CREATE TABLE review (
    review_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(user_id),
    video_id INT REFERENCES video(video_id),
    rating INT,
    comment TEXT
);

INSERT INTO review(user_id, video_id, rating, comment)
VALUES
(1,1,2,'Good movie 1'),
(2,2,3,'Good movie 2'),
(3,3,4,'Good movie 3'),
(4,4,5,'Good movie 4'),
(5,5,1,'Good movie 5'),
(6,6,2,'Good movie 6'),
(7,7,3,'Good movie 7'),
(8,8,4,'Good movie 8'),
(9,9,5,'Good movie 9'),
(10,10,1,'Good movie 10'),
(11,11,2,'Good movie 11'),
(12,12,3,'Good movie 12'),
(13,13,4,'Good movie 13'),
(14,14,5,'Good movie 14'),
(15,15,1,'Good movie 15'),
(1,16,2,'Good movie 16'),
(2,17,3,'Good movie 17'),
(3,18,4,'Good movie 18'),
(4,19,5,'Good movie 19'),
(5,20,1,'Good movie 20');

SELECT * FROM review;


--To display reviews with user names and movie titles:
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


CREATE TABLE payment (
    payment_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(user_id),
    amount DECIMAL(10,2)
);


INSERT INTO payment (user_id, amount)
VALUES
(1, 499.00),
(2, 49.00),
(3, 49.00),
(4, 49.00),
(5, 49.00),
(6, 49.00),
(7, 49.00),
(8, 49.00),
(9, 49.00),
(10, 49.00),
(11, 49.00),
(12, 49.00),
(13, 49.00),
(14, 49.00),
(15, 49.00);

SELECT * FROM payment ;

CREATE TABLE favorites (
    favorite_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(user_id),
    video_id INT REFERENCES video(video_id)
);

CREATE TABLE language (
    language_id SERIAL PRIMARY KEY,
    language_name VARCHAR(50)
);

INSERT INTO language (language_name)
VALUES
('English'),
('Hindi'),
('Spanish'),
('French'),
('Tamil'),
('Telugu'),
('Japanese'),
('Korean'),
('German'),
('Chinese');

SELECT * FROM language;
