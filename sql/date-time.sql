examples of uses of char:

city char
state char
tweet char
sex char

- any fixed data 

create table inventory (
    item_name varchar(100),
    -- price float,
    -- 999,999,99
    price decimal(8,2),
    quantity int
);

datetime v. timestamp:

- range of timestamp is January 1, 1970 to January 19, 2038; where as, 
- the range of datetime is from 1000-01-01 to 9999-12-31
- timestamp is automatically initialized and updated when data in row is changed
- timestamp default is 0; and
- datetime default is null when initialized

select curtime();

-- mysql> select curtime();
-- +-----------+
-- | curtime() |
-- +-----------+
-- | 14:54:27  |
-- +-----------+
-- 1 row in set (0.00 sec)

select curdate();

-- mysql> select curdate();
-- +------------+
-- | curdate()  |
-- +------------+
-- | 2018-04-23 |
-- +------------+
-- 1 row in set (0.00 sec)

select DAYOFWEEK(curdate());

-- mysql> select DAYOFWEEK(curdate());
-- +----------------------+
-- | DAYOFWEEK(curdate()) |
-- +----------------------+
-- |                    2 |
-- +----------------------+
-- 1 row in set (0.00 sec)

select dayname(curdate());

-- mysql> select dayname(curdate());
-- +--------------------+
-- | dayname(curdate()) |
-- +--------------------+
-- | Monday             |
-- +--------------------+
-- 1 row in set (0.00 sec)

select date_format(curdate(), "%m/%e/%Y");

-- now()

-- mysql> select date_format(curdate(), "%m/%e/%Y");
-- +------------------------------------+
-- | date_format(curdate(), "%m/%e/%Y") |
-- +------------------------------------+
-- | 04/23/2018                         |
-- +------------------------------------+
-- 1 row in set (0.00 sec)

select concat(date_format(curdate(), '%M %D'),' at ', time_format(curtime(), "%l:%i"));

-- mysql> select concat(date_format(curdate(), '%M %D'),' at ', time_format(curtime(), "%l:%i"));
-- +---------------------------------------------------------------------------------+
-- | concat(date_format(curdate(), '%M %D'),' at ', time_format(curtime(), "%l:%i")) |
-- +---------------------------------------------------------------------------------+
-- | April 23rd at 4:52                                                              |
-- +---------------------------------------------------------------------------------+
-- 1 row in set (0.00 sec)

create table tweets (
    content char(140),
    username varchar(255),
    time_created timestamp default current_timestamp on update current_timestamp
);

-- now()

-- mysql> desc tweets;
-- +--------------+--------------+------+-----+-------------------+-----------------------------+
-- | Field        | Type         | Null | Key | Default           | Extra                       |
-- +--------------+--------------+------+-----+-------------------+-----------------------------+
-- | content      | char(140)    | YES  |     | NULL              |                             |
-- | username     | varchar(255) | YES  |     | NULL              |                             |
-- | time_created | timestamp    | NO   |     | CURRENT_TIMESTAMP | on update CURRENT_TIMESTAMP |
-- +--------------+--------------+------+-----+-------------------+-----------------------------+
-- 3 rows in set (0.00 sec)

-- mysql> select * from tweets;
-- +-----------------------+----------+---------------------+
-- | content               | username | time_created        |
-- +-----------------------+----------+---------------------+
-- | this is a tweet       | bob      | 2018-04-23 16:15:44 |
-- | this is a tweet       | bob      | 2018-04-23 16:15:54 |
-- | this is another tweet | kevin    | 2018-04-23 16:16:42 |
-- | allo                  | stewart  | 2018-04-23 16:18:13 |
-- +-----------------------+----------+---------------------+
-- 4 rows in set (0.00 sec)
