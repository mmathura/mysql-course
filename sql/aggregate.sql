select count(*) as books from books; 

-- mysql> select count(*) as books from books;                                                                                        
-- +-------+
-- | books |
-- +-------+
-- |    19 |
-- +-------+
-- 1 row in set (0.00 sec)

select count(*) as books, released_year from books group by released_year;

-- mysql> select count(*) as books, released_year from books group by released_year;
-- +-------+---------------+
-- | books | released_year |
-- +-------+---------------+
-- |     1 |          1945 |
-- |     1 |          1981 |
-- |     1 |          1985 |
-- |     1 |          1989 |
-- |     1 |          1996 |
-- |     1 |          2000 |
-- |     3 |          2001 |
-- |     2 |          2003 |
-- |     1 |          2004 |
-- |     1 |          2005 |
-- |     1 |          2010 |
-- |     1 |          2012 |
-- |     1 |          2013 |
-- |     1 |          2014 |
-- |     1 |          2016 |
-- |     1 |          2017 |
-- +-------+---------------+
-- 16 rows in set (0.01 sec)

select sum(stock_quantity) as total from books; 

-- mysql> select sum(stock_quantity) as total from books; 
-- +-------+
-- | total |
-- +-------+
-- |  2450 |
-- +-------+
-- 1 row in set (0.00 sec)

select author_lname, author_fname, avg(released_year) as released from books group by author_lname, author_fname;

-- mysql> select author_lname, author_fname, avg(released_year) as released from books group by author_lname, author_fname;
-- +----------------+--------------+-----------+
-- | author_lname   | author_fname | released  |
-- +----------------+--------------+-----------+
-- | Carver         | Raymond      | 1985.0000 |
-- | Chabon         | Michael      | 2000.0000 |
-- | DeLillo        | Don          | 1985.0000 |
-- | Eggers         | Dave         | 2008.6667 |
-- | Foster Wallace | David        | 2004.5000 |
-- | Gaiman         | Neil         | 2006.6667 |
-- | Harris         | Dan          | 2014.0000 |
-- | Harris         | Freida       | 2001.0000 |
-- | Lahiri         | Jhumpa       | 1999.5000 |
-- | Saunders       | George       | 2017.0000 |
-- | Smith          | Patti        | 2010.0000 |
-- | Steinbeck      | John         | 1945.0000 |
-- +----------------+--------------+-----------+
-- 12 rows in set (0.00 sec)

-- faster
select concat(author_fname, ' ', author_lname) as author, pages from books order by pages desc limit 1; 
-- sub query 
select concat(author_fname, ' ', author_lname) as author, pages from books 
where pages = (select max(pages) from books);

-- mysql> select concat(author_fname, ' ', author_lname) as author, pages from books order by pages desc limit 1; 
-- +----------------+-------+
-- | author         | pages |
-- +----------------+-------+
-- | Michael Chabon |   634 |
-- +----------------+-------+
-- 1 row in set (0.00 sec)

select released_year as year, count(*) as '# books', avg(pages) as 'ave pages' from books group by released_year;

-- mysql> select released_year as year, count(*) as '# books', avg(pages) as 'ave pages' from books group by released_year;
-- +------+---------+-----------+
-- | year | # books | ave pages |
-- +------+---------+-----------+
-- | 1945 |       1 |  181.0000 |
-- | 1981 |       1 |  176.0000 |
-- | 1985 |       1 |  320.0000 |
-- | 1989 |       1 |  526.0000 |
-- | 1996 |       1 |  198.0000 |
-- | 2000 |       1 |  634.0000 |
-- | 2001 |       3 |  443.3333 |
-- | 2003 |       2 |  249.5000 |
-- | 2004 |       1 |  329.0000 |
-- | 2005 |       1 |  343.0000 |
-- | 2010 |       1 |  304.0000 |
-- | 2012 |       1 |  352.0000 |
-- | 2013 |       1 |  504.0000 |
-- | 2014 |       1 |  256.0000 |
-- | 2016 |       1 |  304.0000 |
-- | 2017 |       1 |  367.0000 |
-- +------+---------+-----------+
-- 16 rows in set (0.00 sec)

