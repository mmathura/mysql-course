SELECT 10 != 10; -- false

SELECT 15 > 14 && 99 - 5 <= 94; -- true

SELECT 1 IN (5,3) || 9 BETWEEN 8 AND 10; -- true 

select * from books where released_year < 1980;    

-- mysql> select * from books where released_year < 1980;                                                                              
-- +---------+-------------+--------------+--------------+---------------+----------------+-------+
-- | book_id | title       | author_fname | author_lname | released_year | stock_quantity | pages |
-- +---------+-------------+--------------+--------------+---------------+----------------+-------+
-- |      14 | Cannery Row | John         | Steinbeck    |          1945 |             95 |   181 |
-- +---------+-------------+--------------+--------------+---------------+----------------+-------+
-- 1 row in set (0.00 sec)

select * from books where author_lname = 'Eggers' || author_lname = 'Chabon';
select * from books where author_lname = 'Eggers' or author_lname = 'Chabon';
select * from books where author_lname in ('Eggers','Chabon');



-- mysql> select * from books where author_lname = 'Eggers' || author_lname = 'Chabon';
-- +---------+-------------------------------------------+--------------+--------------+---------------+----------------+-------+
-- | book_id | title                                     | author_fname | author_lname | released_year | stock_quantity | pages |
-- +---------+-------------------------------------------+--------------+--------------+---------------+----------------+-------+
-- |       5 | A Hologram for the King: A Novel          | Dave         | Eggers       |          2012 |            154 |   352 |
-- |       6 | The Circle                                | Dave         | Eggers       |          2013 |             26 |   504 |
-- |       7 | The Amazing Adventures of Kavalier & Clay | Michael      | Chabon       |          2000 |             68 |   634 |
-- |       9 | A Heartbreaking Work of Staggering Genius | Dave         | Eggers       |          2001 |            104 |   437 |
-- +---------+-------------------------------------------+--------------+--------------+---------------+----------------+-------+
-- 4 rows in set (0.00 sec)

select * from books where author_lname = 'Lahiri' and released_year > 2000;

-- mysql> select * from books where author_lname = 'Lahiri' and released_year > 2000;
-- +---------+--------------+--------------+--------------+---------------+----------------+-------+
-- | book_id | title        | author_fname | author_lname | released_year | stock_quantity | pages |
-- +---------+--------------+--------------+--------------+---------------+----------------+-------+
-- |       1 | The Namesake | Jhumpa       | Lahiri       |          2003 |             32 |   291 |
-- +---------+--------------+--------------+--------------+---------------+----------------+-------+
-- 1 row in set (0.00 sec)

-- mysql> select title, author_lname, released_year from books where author_lname = 'Lahiri';                                         
-- +-------------------------+--------------+---------------+
-- | title                   | author_lname | released_year |
-- +-------------------------+--------------+---------------+
-- | The Namesake            | Lahiri       |          2003 |
-- | Interpreter of Maladies | Lahiri       |          1996 |
-- +-------------------------+--------------+---------------+
-- 2 rows in set (0.00 sec)

select * from books where pages between 100 and 200;

-- mysql> select * from books where pages between 100 and 200;
-- +---------+-----------------------------------------------------+--------------+--------------+---------------+----------------+-------+
-- | book_id | title                                               | author_fname | author_lname | released_year | stock_quantity | pages |
-- +---------+-----------------------------------------------------+--------------+--------------+---------------+----------------+-------+
-- |       4 | Interpreter of Maladies                             | Jhumpa       | Lahiri       |          1996 |             97 |   198 |
-- |      11 | What We Talk About When We Talk About Love: Stories | Raymond      | Carver       |          1981 |             23 |   176 |
-- |      14 | Cannery Row                                         | John         | Steinbeck    |          1945 |             95 |   181 |
-- +---------+-----------------------------------------------------+--------------+--------------+---------------+----------------+-------+
-- 3 rows in set (0.00 sec)

select * from books where author_lname like 'C%' or author_lname like 'S%';
-- where substr(author_lname, 1, 1) in ('C', 'S') 

-- mysql> select * from books where author_lname like 'C%' or author_lname like 'S%';
-- +---------+-----------------------------------------------------+--------------+--------------+---------------+----------------+-------+
-- | book_id | title                                               | author_fname | author_lname | released_year | stock_quantity | pages |
-- +---------+-----------------------------------------------------+--------------+--------------+---------------+----------------+-------+
-- |       7 | The Amazing Adventures of Kavalier & Clay           | Michael      | Chabon       |          2000 |             68 |   634 |
-- |       8 | Just Kids                                           | Patti        | Smith        |          2010 |             55 |   304 |
-- |      11 | What We Talk About When We Talk About Love: Stories | Raymond      | Carver       |          1981 |             23 |   176 |
-- |      12 | Where I'm Calling From: Selected Stories            | Raymond      | Carver       |          1989 |             12 |   526 |
-- |      14 | Cannery Row                                         | John         | Steinbeck    |          1945 |             95 |   181 |
-- |      19 | Lincoln In The Bardo                                | George       | Saunders     |          2017 |           1000 |   367 |
-- +---------+-----------------------------------------------------+--------------+--------------+---------------+----------------+-------+
-- 6 rows in set (0.00 sec)

select title, author_lname, 
case 
    when title like '%stories%' then 'Short Stories'
    when title in('Just Kids', 'A Heartbreaking Work of Staggering Genius') then 'Memoir'
    else 'Novel'
end as type
from books;

-- mysql> select title, author_lname, 
--     -> case 
--     ->     when title like '%stories%' then 'Short Stories'
--     ->     when title in('Just Kids', 'A Heartbreaking Work of Staggering Genius') then 'Memoir'
--     ->     else 'Novel'
--     -> end as type
--     -> from books;
-- +-----------------------------------------------------+----------------+---------------+
-- | title                                               | author_lname   | type          |
-- +-----------------------------------------------------+----------------+---------------+
-- | The Namesake                                        | Lahiri         | Novel         |
-- | Norse Mythology                                     | Gaiman         | Novel         |
-- | American Gods                                       | Gaiman         | Novel         |
-- | Interpreter of Maladies                             | Lahiri         | Novel         |
-- | A Hologram for the King: A Novel                    | Eggers         | Novel         |
-- | The Circle                                          | Eggers         | Novel         |
-- | The Amazing Adventures of Kavalier & Clay           | Chabon         | Novel         |
-- | Just Kids                                           | Smith          | Memoir        |
-- | A Heartbreaking Work of Staggering Genius           | Eggers         | Memoir        |
-- | Coraline                                            | Gaiman         | Novel         |
-- | What We Talk About When We Talk About Love: Stories | Carver         | Short Stories |
-- | Where I'm Calling From: Selected Stories            | Carver         | Short Stories |
-- | White Noise                                         | DeLillo        | Novel         |
-- | Cannery Row                                         | Steinbeck      | Novel         |
-- | Oblivion: Stories                                   | Foster Wallace | Short Stories |
-- | Consider the Lobster                                | Foster Wallace | Novel         |
-- | 10% Happier                                         | Harris         | Novel         |
-- | fake_book                                           | Harris         | Novel         |
-- | Lincoln In The Bardo                                | Saunders       | Novel         |
-- +-----------------------------------------------------+----------------+---------------+
-- 19 rows in set (0.00 sec)

select title, author_lname, 
    case
        when count(author_lname) > 1 then concat(count(author_lname), ' books')
        else concat(count(author_lname), ' book')
    end as count
from books group by author_lname, author_fname;

-- when count(*) = 1 'book' else 'books'

-- mysql> select title, author_lname, 
--     ->     case
--     ->         when count(author_lname) > 1 then concat(count(author_lname), ' books')
--     ->         else concat(count(author_lname), ' book')
--     ->     end as count
--     -> from books group by author_lname, author_fname;
-- +-----------------------------------------------------+----------------+---------+
-- | title                                               | author_lname   | count   |
-- +-----------------------------------------------------+----------------+---------+
-- | What We Talk About When We Talk About Love: Stories | Carver         | 2 books |
-- | The Amazing Adventures of Kavalier & Clay           | Chabon         | 1 book  |
-- | White Noise                                         | DeLillo        | 1 book  |
-- | A Hologram for the King: A Novel                    | Eggers         | 3 books |
-- | Oblivion: Stories                                   | Foster Wallace | 2 books |
-- | Norse Mythology                                     | Gaiman         | 3 books |
-- | 10% Happier                                         | Harris         | 1 book  |
-- | fake_book                                           | Harris         | 1 book  |
-- | The Namesake                                        | Lahiri         | 2 books |
-- | Lincoln In The Bardo                                | Saunders       | 1 book  |
-- | Just Kids                                           | Smith          | 1 book  |
-- | Cannery Row                                         | Steinbeck      | 1 book  |
-- +-----------------------------------------------------+----------------+---------+
-- 12 rows in set (0.01 sec)

