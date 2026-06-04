
#OTT_Database Schema

create table users(
user_id Serial primary key,
user_name varchar(255),
user_email varchar(255),
mobile varchar(13),
user_password varchar(255)
);

INSERT INTO users (user_name, user_email, mobile,user_password)
VALUES
('rahul', 'rahul@gmail.com','9897949597','rahul@123'),
('nandu', 'nandu@gmail.com', '9897949596','nandu@123'),
('surekha', 'surekha@gmail.com', '9897949595','surekha@123'),
('raja', 'raja@gmail.com', '9897949594','raja@123'),
('arvind', 'arvind@gmail.com', '9897949591','arvind@123'),
('pawan', 'pawan@gmail.com', '9897949592','pawan@123'),
('deekshitha', 'deekshitha@gmail.com', '9897949590','deekshitha@123');

select * from users;

SELECT count(*) as total_users
FROM users;

CREATE TABLE subscription_plans (
    plan_id SERIAL PRIMARY KEY,
    plan_name VARCHAR(50) NOT NULL,
    monthly_price DECIMAL(10,2) NOT NULL
);

CREATE TABLE profiles (
    profile_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    profile_name VARCHAR(50) NOT NULL,
    profile_picture VARCHAR(500),
    age_group VARCHAR(20)
);



INSERT INTO profiles
(user_id, profile_name, profile_picture, age_group)
VALUES
(1, 'Rahul', 'rahul_avatar.png', 'Adult'),
(2, 'nandu', 'nandu_avatar.png', 'Adult'),
(3, 'surekha', 'surekha_profile.jpg', 'Adult'),
(4, 'raja', 'raja_avatar.webp', 'Adult'),
(5, 'arvind', 'arvind_pic.png', 'Adult'),
(6, 'pawan', 'pawan_profile.jpg', 'Adult');


select * from profiles;

SELECT profile_name, profile_picture
FROM profiles;

SELECT *
FROM profiles
WHERE user_id = 1;

SELECT user_id, COUNT(*) AS profile_count
FROM profiles
GROUP BY user_id;

SELECT user_id, COUNT(*) AS profile_count
FROM profiles
GROUP BY user_id
HAVING COUNT(*) > 1;

SELECT *
FROM profiles
WHERE age_group = 'Kids';

SELECT *
FROM profiles
WHERE profile_name LIKE 'A%';

UPDATE profiles
SET profile_picture = 'new_avatar.png'
WHERE profile_id = 3;

DELETE FROM profiles
WHERE profile_id = 2;

SELECT age_group, COUNT(*) AS total_profiles
FROM profiles
GROUP BY age_group;

SELECT u.user_id,
       u.email,
       p.profile_name,
       p.profile_picture
FROM users u
JOIN profiles p
ON u.user_id = p.user_id;

SELECT u.user_id, u.email
FROM users u
LEFT JOIN profiles p
ON u.user_id = p.user_id
WHERE p.profile_id IS NULL;

--Find the number of profiles per age group
SELECT age_group,
       COUNT(*) AS total
FROM profiles
GROUP BY age_group
ORDER BY total DESC;

SELECT *
FROM profiles
LIMIT 5;

CREATE TABLE video (
    video_id SERIAL PRIMARY KEY,
    video_title VARCHAR(255),
    genre_id INT REFERENCES genre(genre_id),
    release_year INT
);


select * from subscription_plans;

INSERT INTO subscription_plans
(plan_name, monthly_price)
VALUES
('Basic', 199.00),
('Standard', 499.00),
('Premium', 649.00),
('Family', 799.00),
('Annual Basic', 1999.00),
('Annual Premium', 6499.00);

select * from subscription_plans;

CREATE TABLE subscriptions (
    subscription_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    plan_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE,
    status VARCHAR(20) NOT NULL,

    CONSTRAINT fk_user
        FOREIGN KEY (user_id)
        REFERENCES users(user_id),

    CONSTRAINT fk_plan
        FOREIGN KEY (plan_id)
        REFERENCES subscription_plans(plan_id)
);


INSERT INTO subscriptions
(user_id, plan_id, start_date, end_date, status)
VALUES
(1, 1, '2025-01-01', '2025-02-01', 'Active'),
(2, 2, '2025-01-15', '2025-02-15', 'Active'),
(3, 4, '2025-02-01', '2025-03-01', 'Expired'),
(4, 3, '2025-02-10', '2025-03-10', 'Cancelled'),
(5, 5, '2025-03-01', '2025-04-01', 'Active'),
(6, 2, '2025-03-15', '2025-04-15', 'Active');

select * from subscriptions;

--Show active subscriptions

SELECT *
select * 
from subscriptions 
where status = 'Active';

SELECT s.subscription_id,
       s.user_id,
       p.plan_name,
       s.start_date,
       s.end_date,
       s.status
FROM subscriptions s
JOIN subscription_plans p
ON s.plan_id = p.plan_id;

SELECT status,
       COUNT(*) AS total_subscriptions
FROM subscriptions
GROUP BY status;

SELECT *
FROM subscriptions
WHERE status = 'Expired';

--Find the latest subscription
SELECT *
FROM subscriptions
ORDER BY start_date DESC
LIMIT 1;

--Find subscriptions ending this month
SELECT *
FROM subscriptions
WHERE EXTRACT(MONTH FROM end_date) = EXTRACT(MONTH FROM CURRENT_DATE)
  AND EXTRACT(YEAR FROM end_date) = EXTRACT(YEAR FROM CURRENT_DATE);

CREATE TABLE payments (
    payment_id SERIAL PRIMARY KEY,
    subscription_id INT REFERENCES subscriptions(subscription_id),
    amount DECIMAL(10,2) NOT NULL,
    payment_method VARCHAR(20),
    payment_date DATE,
    payment_status VARCHAR(20)
);

select * from subscriptions;
INSERT INTO payments
(subscription_id, amount, payment_method, payment_date, payment_status)
VALUES
(11, 199.00, 'Credit Card', '2025-01-01', 'Success'),
(12, 499.00, 'UPI', '2025-01-15', 'Success'),
(13, 649.00, 'Debit Card', '2025-02-01', 'Success'),
(14, 799.00, 'Net Banking', '2025-02-10', 'Failed'),
(15, 149.00, 'UPI', '2025-03-01', 'Pending'),
(16, 149.00, 'UPI', '2025-03-01', 'Pending');
select * from payments;

SELECT * FROM payments;

SELECT SUM(amount) AS total_revenue
FROM payments
WHERE payment_status = 'Success';

SELECT *
FROM payments
WHERE payment_status = 'Failed';

SELECT payment_method,
       COUNT(*) AS total_payments
FROM payments
GROUP BY payment_method;

-- Show payment details with plan names

SELECT p.payment_id,
       sp.plan_name,
       p.amount,
       p.payment_status
FROM payments p
JOIN subscriptions s
ON p.subscription_id = s.subscription_id
JOIN subscription_plans sp
ON s.plan_id = sp.plan_id;

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
(6,6);

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
