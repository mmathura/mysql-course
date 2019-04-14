-- CREATE TABLE users (
--     id INTEGER AUTO_INCREMENT PRIMARY KEY,
--     username VARCHAR(255) UNIQUE NOT NULL,
--     created_at TIMESTAMP DEFAULT NOW()
-- );

-- CREATE TABLE photos (
--     id INTEGER AUTO_INCREMENT PRIMARY KEY,
--     image_url VARCHAR(255) NOT NULL,
--     user_id INTEGER NOT NULL,
--     created_at TIMESTAMP DEFAULT NOW(),
--     FOREIGN KEY(user_id) REFERENCES users(id)
-- );

-- CREATE TABLE comments (
--     id INTEGER AUTO_INCREMENT PRIMARY KEY,
--     comment_text VARCHAR(255) NOT NULL,
--     photo_id INTEGER NOT NULL,
--     user_id INTEGER NOT NULL,
--     created_at TIMESTAMP DEFAULT NOW(),
--     FOREIGN KEY(photo_id) REFERENCES photos(id),
--     FOREIGN KEY(user_id) REFERENCES users(id)
-- );

-- CREATE TABLE likes (
--     user_id INTEGER NOT NULL,
--     photo_id INTEGER NOT NULL,
--     created_at TIMESTAMP DEFAULT NOW(),
--     FOREIGN KEY(user_id) REFERENCES users(id),
--     FOREIGN KEY(photo_id) REFERENCES photos(id),
--     PRIMARY KEY(user_id, photo_id)
-- );

-- CREATE TABLE follows (
--     follower_id INTEGER NOT NULL,
--     followee_id INTEGER NOT NULL,
--     created_at TIMESTAMP DEFAULT NOW(),
--     FOREIGN KEY(follower_id) REFERENCES users(id),
--     FOREIGN KEY(followee_id) REFERENCES users(id),
--     PRIMARY KEY(follower_id, followee_id)
-- );

-- CREATE TABLE tags (
--   id INTEGER AUTO_INCREMENT PRIMARY KEY,
--   tag_name VARCHAR(255) UNIQUE,
--   created_at TIMESTAMP DEFAULT NOW()
-- );

-- CREATE TABLE photo_tags (
--     photo_id INTEGER NOT NULL,
--     tag_id INTEGER NOT NULL,
--     FOREIGN KEY(photo_id) REFERENCES photos(id),
--     FOREIGN KEY(tag_id) REFERENCES tags(id),
--     PRIMARY KEY(photo_id, tag_id)
-- );

-- challenge 1 - 5 oldest accounts

select * from users order by created_at asc limit 5;

-- mysql> select * from users order by created_at asc limit 5;
-- +----+------------------+---------------------+
-- | id | username         | created_at          |
-- +----+------------------+---------------------+
-- | 80 | Darby_Herzog     | 2016-05-06 00:14:21 |
-- | 67 | Emilio_Bernier52 | 2016-05-06 13:04:29 |
-- | 63 | Elenor88         | 2016-05-08 01:30:40 |
-- | 95 | Nicole71         | 2016-05-09 17:30:22 |
-- | 38 | Jordyn.Jacobson2 | 2016-05-14 07:56:25 |
-- +----+------------------+---------------------+
-- 5 rows in set (0.00 sec)

-- challenge 2

select dayofweek(created_at) as weekday, count(*) as new_accounts
from users group by weekday order by new_accounts asc;

-- mysql> select dayofweek(created_at) as weekday, count(*) as new_accounts  from users group by weekday order by new_accounts asc;
-- +---------+--------------+
-- | weekday | new_accounts |
-- +---------+--------------+
-- |       7 |           12 |
-- |       4 |           13 |
-- |       2 |           14 |
-- |       3 |           14 |
-- |       6 |           15 |
-- |       5 |           16 |
-- |       1 |           16 |
-- +---------+--------------+
-- 7 rows in set (0.00 sec)

-- challenge 3 inactive accounts 

select username, image_url from users left join photos 
on users.id = photos.user_id where photos.id is null;

-- mysql> select username from users left join photos on users.id = photos.user_id where photos.image_url is null;
-- +---------------------+
-- | username            |
-- +---------------------+
-- | Aniya_Hackett       |
-- | Bartholome.Bernhard |
-- | Bethany20           |
-- | Darby_Herzog        |
-- | David.Osinski47     |
-- | Duane60             |
-- | Esmeralda.Mraz57    |
-- | Esther.Zulauf61     |
-- | Franco_Keebler64    |
-- | Hulda.Macejkovic    |
-- | Jaclyn81            |
-- | Janelle.Nikolaus81  |
-- | Jessyca_West        |
-- | Julien_Schmidt      |
-- | Kasandra_Homenick   |
-- | Leslie67            |
-- | Linnea59            |
-- | Maxwell.Halvorson   |
-- | Mckenna17           |
-- | Mike.Auer39         |
-- | Morgan.Kassulke     |
-- | Nia_Haag            |
-- | Ollie_Ledner37      |
-- | Pearl7              |
-- | Rocio33             |
-- | Tierra.Trantow      |
-- +---------------------+
-- 26 rows in set (0.00 sec)

-- mysql> select username, image_url from users left join photos 
--     -> on users.id = photos.user_id where photos.id is null;
-- +---------------------+-----------+
-- | username            | image_url |
-- +---------------------+-----------+
-- | Aniya_Hackett       | NULL      |
-- | Bartholome.Bernhard | NULL      |
-- | Bethany20           | NULL      |
-- | Darby_Herzog        | NULL      |
-- | David.Osinski47     | NULL      |
-- | Duane60             | NULL      |
-- | Esmeralda.Mraz57    | NULL      |
-- | Esther.Zulauf61     | NULL      |
-- | Franco_Keebler64    | NULL      |
-- | Hulda.Macejkovic    | NULL      |
-- | Jaclyn81            | NULL      |
-- | Janelle.Nikolaus81  | NULL      |
-- | Jessyca_West        | NULL      |
-- | Julien_Schmidt      | NULL      |
-- | Kasandra_Homenick   | NULL      |
-- | Leslie67            | NULL      |
-- | Linnea59            | NULL      |
-- | Maxwell.Halvorson   | NULL      |
-- | Mckenna17           | NULL      |
-- | Mike.Auer39         | NULL      |
-- | Morgan.Kassulke     | NULL      |
-- | Nia_Haag            | NULL      |
-- | Ollie_Ledner37      | NULL      |
-- | Pearl7              | NULL      |
-- | Rocio33             | NULL      |
-- | Tierra.Trantow      | NULL      |
-- +---------------------+-----------+
-- 26 rows in set (0.00 sec)

-- challenge 4 - most liked photo

select photos.id, photos.user_id, count(*) as most_liked, users.username 
from photos 
inner join likes 
on photos.id = likes.photo_id
inner join users on 
photos.user_id = users.id
group by photos.id 
order by most_liked desc limit 1;    

-- mysql> select photos.id, photos.user_id, count(*) as most_liked, users.username 
--     -> from photos inner join likes 
--     -> on photos.id = likes.photo_id
--     -> inner join users on 
--     -> photos.user_id = users.id
--     -> group by photos.id 
--     -> order by most_liked desc limit 1;    
-- +-----+---------+------------+---------------+
-- | id  | user_id | most_liked | username      |
-- +-----+---------+------------+---------------+
-- | 145 |      52 |         48 | Zack_Kemmer93 |
-- +-----+---------+------------+---------------+
-- 1 row in set (0.01 sec)


-- Challenge 5 - How many times does the average user post? 

select (select count(*) from photos) / (select count(*) from users) as average_posts;

-- mysql> select (select count(*) from photos) / (select count(*) from users) as average_posts;
-- +---------------+
-- | average_posts |
-- +---------------+
-- |        2.5700 |
-- +---------------+
-- 1 row in set (0.00 sec)

-- challenge 6

select tags.tag_name, count(*) as total  
from photo_tags join tags on
photo_tags.tag_id = tags.id 
group by tags.id 
order by total desc limit 5;

-- mysql> select tags.tag_name, count(*) as total  
--     -> from photo_tags join tags on
--     -> photo_tags.tag_id = tags.id 
--     -> group by tags.id 
--     -> order by total desc limit 5;
-- +----------+-------+
-- | tag_name | total |
-- +----------+-------+
-- | smile    |    59 |
-- | beach    |    42 |
-- | party    |    39 |
-- | fun      |    38 |
-- | food     |    24 |
-- +----------+-------+
-- 5 rows in set (0.00 sec)

-- challenge 7

-- mysql> SELECT username, 
--     ->        Count(*) AS num_likes 
--     -> FROM   users 
--     ->        INNER JOIN likes 
--     ->                ON users.id = likes.user_id 
--     -> GROUP  BY likes.user_id 
--     -> HAVING num_likes = (SELECT Count(*) 
--     ->                     FROM   photos); 
-- +--------------------+-----------+
-- | username           | num_likes |
-- +--------------------+-----------+
-- | Aniya_Hackett      |       257 |
-- | Jaclyn81           |       257 |
-- | Rocio33            |       257 |
-- | Maxwell.Halvorson  |       257 |
-- | Ollie_Ledner37     |       257 |
-- | Mckenna17          |       257 |
-- | Duane60            |       257 |
-- | Julien_Schmidt     |       257 |
-- | Mike.Auer39        |       257 |
-- | Nia_Haag           |       257 |
-- | Leslie67           |       257 |
-- | Janelle.Nikolaus81 |       257 |
-- | Bethany20          |       257 |
-- +--------------------+-----------+
-- 13 rows in set (0.01 sec)


