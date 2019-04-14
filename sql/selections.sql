SELECT DISTINCT author_fname, author_lname FROM books;

-- mysql> SELECT DISTINCT author_fname, author_lname FROM books;
-- +--------------+----------------+
-- | author_fname | author_lname   |
-- +--------------+----------------+
-- | Jhumpa       | Lahiri         |
-- | Neil         | Gaiman         |
-- | Dave         | Eggers         |
-- | Michael      | Chabon         |
-- | Patti        | Smith          |
-- | Raymond      | Carver         |
-- | Don          | DeLillo        |
-- | John         | Steinbeck      |
-- | David        | Foster Wallace |
-- | Dan          | Harris         |
-- | Freida       | Harris         |
-- | George       | Saunders       |
-- +--------------+----------------+
-- 12 rows in set (0.00 sec)

SELECT author_fname, author_lname FROM books 
ORDER BY author_lname, author_fname;

-- mysql> SELECT author_fname, author_lname FROM books 
--     -> ORDER BY author_lname, author_fname;
-- +--------------+----------------+
-- | author_fname | author_lname   |
-- +--------------+----------------+
-- | Raymond      | Carver         |
-- | Raymond      | Carver         |
-- | Michael      | Chabon         |
-- | Don          | DeLillo        |
-- | Dave         | Eggers         |
-- | Dave         | Eggers         |
-- | Dave         | Eggers         |
-- | David        | Foster Wallace |
-- | David        | Foster Wallace |
-- | Neil         | Gaiman         |
-- | Neil         | Gaiman         |
-- | Neil         | Gaiman         |
-- | Dan          | Harris         |
-- | Freida       | Harris         |
-- | Jhumpa       | Lahiri         |
-- | Jhumpa       | Lahiri         |
-- | George       | Saunders       |
-- | Patti        | Smith          |
-- | John         | Steinbeck      |
-- +--------------+----------------+
-- 19 rows in set (0.00 sec)

SELECT title, released_year FROM books 
ORDER BY released_year DESC LIMIT 1,3;

-- mysql> SELECT title, released_year FROM books 
--     -> ORDER BY released_year DESC LIMIT 1,3;
-- +-----------------+---------------+
-- | title           | released_year |
-- +-----------------+---------------+
-- | Norse Mythology |          2016 |
-- | 10% Happier     |          2014 |
-- | The Circle      |          2013 |
-- +-----------------+---------------+
-- 3 rows in set (0.00 sec)

SELECT title FROM books WHERE title LIKE '%the%';

-- mysql> SELECT title FROM books WHERE title LIKE '%the%';
-- +-------------------------------------------+
-- | title                                     |
-- +-------------------------------------------+
-- | The Namesake                              |
-- | A Hologram for the King: A Novel          |
-- | The Circle                                |
-- | The Amazing Adventures of Kavalier & Clay |
-- | Consider the Lobster                      |
-- | Lincoln In The Bardo                      |
-- +-------------------------------------------+
-- 6 rows in set (0.00 sec)

SELECT title, stock_quantity FROM books WHERE stock_quantity LIKE '____';

-- mysql> SELECT title, stock_quantity FROM books WHERE stock_quantity LIKE '____';
-- +----------------------+----------------+
-- | title                | stock_quantity |
-- +----------------------+----------------+
-- | Lincoln In The Bardo |           1000 |
-- +----------------------+----------------+
-- 1 row in set (0.00 sec)

SELECT title FROM books WHERE title LIKE '%\%%';

-- mysql> SELECT title FROM books WHERE title LIKE '%\%%'
--     -> ;
-- +-------------+
-- | title       |
-- +-------------+
-- | 10% Happier |
-- +-------------+
-- 1 row in set (0.00 sec)

SELECT title FROM books WHERE title LIKE '%\_%';

-- mysql> SELECT title FROM books WHERE title LIKE '%\_%';
-- +-----------+
-- | title     |
-- +-----------+
-- | fake_book |
-- +-----------+
-- 1 row in set (0.00 sec)

-- Exercises for selections 

select title from books where title like '%stories%';

-- mysql> select title from books where title like '%stories%';
-- +-----------------------------------------------------+
-- | title                                               |
-- +-----------------------------------------------------+
-- | What We Talk About When We Talk About Love: Stories |
-- | Where I'm Calling From: Selected Stories            |
-- | Oblivion: Stories                                   |
-- +-----------------------------------------------------+
-- 3 rows in set (0.00 sec)

-- mysql> desc books;
-- +----------------+--------------+------+-----+---------+----------------+
-- | Field          | Type         | Null | Key | Default | Extra          |
-- +----------------+--------------+------+-----+---------+----------------+
-- | book_id        | int(11)      | NO   | PRI | NULL    | auto_increment |
-- | title          | varchar(100) | YES  |     | NULL    |                |
-- | author_fname   | varchar(100) | YES  |     | NULL    |                |
-- | author_lname   | varchar(100) | YES  |     | NULL    |                |
-- | released_year  | int(11)      | YES  |     | NULL    |                |
-- | stock_quantity | int(11)      | YES  |     | NULL    |                |
-- | pages          | int(11)      | YES  |     | NULL    |                |
-- +----------------+--------------+------+-----+---------+----------------+
-- 7 rows in set (0.00 sec)

select title, pages from books order by pages desc limit 1; 

-- mysql> select title, pages from books order by pages desc limit 1;                                                                                             
-- +-------------------------------------------+-------+
-- | title                                     | pages |
-- +-------------------------------------------+-------+
-- | The Amazing Adventures of Kavalier & Clay |   634 |
-- +-------------------------------------------+-------+
-- 1 row in set (0.00 sec)

select concat(title, ' - ', released_year) as summary from books order by released_year desc limit 3;

-- mysql> select concat(title, ' - ', released_year) as summary from books order by released_year desc limit 3;
-- +-----------------------------+
-- | summary                     |
-- +-----------------------------+
-- | Lincoln In The Bardo - 2017 |
-- | Norse Mythology - 2016      |
-- | 10% Happier - 2014          |
-- +-----------------------------+
-- 3 rows in set (0.00 sec)

select title, author_lname from books where author_lname like '% %';

-- mysql> select title, author_lname from books where author_lname like '% %';
-- +----------------------+----------------+
-- | title                | author_lname   |
-- +----------------------+----------------+
-- | Oblivion: Stories    | Foster Wallace |
-- | Consider the Lobster | Foster Wallace |
-- +----------------------+----------------+
-- 2 rows in set (0.00 sec)

select title, released_year, stock_quantity from books order by stock_quantity asc limit 3;

-- mysql> select title, released_year, stock_quantity from books order by stock_quantity asc limit 3;
-- +-----------------------------------------------------+---------------+----------------+
-- | title                                               | released_year | stock_quantity |
-- +-----------------------------------------------------+---------------+----------------+
-- | American Gods                                       |          2001 |             12 |
-- | Where I'm Calling From: Selected Stories            |          1989 |             12 |
-- | What We Talk About When We Talk About Love: Stories |          1981 |             23 |
-- +-----------------------------------------------------+---------------+----------------+
-- 3 rows in set (0.00 sec)

select title, author_lname from books order by author_lname, title;   

-- order by 2, 1

-- mysql> select title, author_lname from books order by author_lname, title;   
-- +-----------------------------------------------------+----------------+
-- | title                                               | author_lname   |
-- +-----------------------------------------------------+----------------+
-- | What We Talk About When We Talk About Love: Stories | Carver         |
-- | Where I'm Calling From: Selected Stories            | Carver         |
-- | The Amazing Adventures of Kavalier & Clay           | Chabon         |
-- | White Noise                                         | DeLillo        |
-- | A Heartbreaking Work of Staggering Genius           | Eggers         |
-- | A Hologram for the King: A Novel                    | Eggers         |
-- | The Circle                                          | Eggers         |
-- | Consider the Lobster                                | Foster Wallace |
-- | Oblivion: Stories                                   | Foster Wallace |
-- | American Gods                                       | Gaiman         |
-- | Coraline                                            | Gaiman         |
-- | Norse Mythology                                     | Gaiman         |
-- | 10% Happier                                         | Harris         |
-- | fake_book                                           | Harris         |
-- | Interpreter of Maladies                             | Lahiri         |
-- | The Namesake                                        | Lahiri         |
-- | Lincoln In The Bardo                                | Saunders       |
-- | Just Kids                                           | Smith          |
-- | Cannery Row                                         | Steinbeck      |
-- +-----------------------------------------------------+----------------+
-- 19 rows in set (0.00 sec)

select concat('MY FAVOURITE AUTHOR IS ', upper(author_fname),' ', upper(author_lname), '!') as yell from books order by author_lname asc; 

-- mysql> select concat('MY FAVOURITE AUTHOR IS ', upper(author_fname),' ', upper(author_lname)) as yell from books order by author_lname asc; 
-- +---------------------------------------------+
-- | yell                                        |
-- +---------------------------------------------+
-- | MY FAVOURITE AUTHOR IS RAYMOND CARVER       |
-- | MY FAVOURITE AUTHOR IS RAYMOND CARVER       |
-- | MY FAVOURITE AUTHOR IS MICHAEL CHABON       |
-- | MY FAVOURITE AUTHOR IS DON DELILLO          |
-- | MY FAVOURITE AUTHOR IS DAVE EGGERS          |
-- | MY FAVOURITE AUTHOR IS DAVE EGGERS          |
-- | MY FAVOURITE AUTHOR IS DAVE EGGERS          |
-- | MY FAVOURITE AUTHOR IS DAVID FOSTER WALLACE |
-- | MY FAVOURITE AUTHOR IS DAVID FOSTER WALLACE |
-- | MY FAVOURITE AUTHOR IS NEIL GAIMAN          |
-- | MY FAVOURITE AUTHOR IS NEIL GAIMAN          |
-- | MY FAVOURITE AUTHOR IS NEIL GAIMAN          |
-- | MY FAVOURITE AUTHOR IS FREIDA HARRIS        |
-- | MY FAVOURITE AUTHOR IS DAN HARRIS           |
-- | MY FAVOURITE AUTHOR IS JHUMPA LAHIRI        |
-- | MY FAVOURITE AUTHOR IS JHUMPA LAHIRI        |
-- | MY FAVOURITE AUTHOR IS GEORGE SAUNDERS      |
-- | MY FAVOURITE AUTHOR IS PATTI SMITH          |
-- | MY FAVOURITE AUTHOR IS JOHN STEINBECK       |
-- +---------------------------------------------+
-- 19 rows in set (0.00 sec)

