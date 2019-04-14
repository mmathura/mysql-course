create table students (
    id int auto_increment, 
    primary key (id), 
    first_name varchar(255)
);

create table papers (
    title varchar(255),
    grade int, 
    student_id int, 
    foreign key(student_id) 
        references students(id)
        on delete cascade
);

-- mysql> desc papers;
-- +------------+--------------+------+-----+---------+-------+
-- | Field      | Type         | Null | Key | Default | Extra |
-- +------------+--------------+------+-----+---------+-------+
-- | title      | varchar(255) | YES  |     | NULL    |       |
-- | grade      | int(11)      | YES  |     | NULL    |       |
-- | student_id | int(11)      | YES  | MUL | NULL    |       |
-- +------------+--------------+------+-----+---------+-------+
-- 3 rows in set (0.00 sec)

-- mysql> desc students;
-- +------------+--------------+------+-----+---------+----------------+
-- | Field      | Type         | Null | Key | Default | Extra          |
-- +------------+--------------+------+-----+---------+----------------+
-- | id         | int(11)      | NO   | PRI | NULL    | auto_increment |
-- | first_name | varchar(255) | YES  |     | NULL    |                |
-- +------------+--------------+------+-----+---------+----------------+
-- 2 rows in set (0.00 sec)

INSERT INTO students (first_name) VALUES 
('Caleb'), ('Samantha'), ('Raj'), ('Carlos'), ('Lisa');

INSERT INTO papers (student_id, title, grade ) VALUES
(1, 'My First Book Report', 60),
(1, 'My Second Book Report', 75),
(2, 'Russian Lit Through The Ages', 94),
(2, 'De Montaigne and The Art of The Essay', 98),
(4, 'Borges and Magical Realism', 89);

-- mysql> select * from students;
-- +----+------------+
-- | id | first_name |
-- +----+------------+
-- |  1 | Caleb      |
-- |  2 | Samantha   |
-- |  3 | Raj        |
-- |  4 | Carlos     |
-- |  5 | Lisa       |
-- +----+------------+
-- 5 rows in set (0.00 sec)

-- mysql> select * from papers;
-- +---------------------------------------+-------+------------+
-- | title                                 | grade | student_id |
-- +---------------------------------------+-------+------------+
-- | My First Book Report                  |    60 |          1 |
-- | My Second Book Report                 |    75 |          1 |
-- | Russian Lit Through The Ages          |    94 |          2 |
-- | De Montaigne and The Art of The Essay |    98 |          2 |
-- | Borges and Magical Realism            |    89 |          4 |
-- +---------------------------------------+-------+------------+
-- 5 rows in set (0.00 sec)

select first_name, title, grade from students, papers 
where students.id = papers.student_id order by grade desc;

select first_name, title, grade 
from students 
inner join papers 
    on students.id = papers.student_id
order by grade desc;

-- right joint

-- mysql> select first_name, title, grade from students, papers 
--     -> where students.id = papers.student_id order by grade desc;
-- +------------+---------------------------------------+-------+
-- | first_name | title                                 | grade |
-- +------------+---------------------------------------+-------+
-- | Samantha   | De Montaigne and The Art of The Essay |    98 |
-- | Samantha   | Russian Lit Through The Ages          |    94 |
-- | Carlos     | Borges and Magical Realism            |    89 |
-- | Caleb      | My Second Book Report                 |    75 |
-- | Caleb      | My First Book Report                  |    60 |
-- +------------+---------------------------------------+-------+
-- 5 rows in set (0.00 sec)

select first_name, title, grade from students 
left join papers on students.id = papers.student_id;

-- mysql> select first_name, title, grade from students 
--     -> left join papers on students.id = papers.student_id;
-- +------------+---------------------------------------+-------+
-- | first_name | title                                 | grade |
-- +------------+---------------------------------------+-------+
-- | Caleb      | My First Book Report                  |    60 |
-- | Caleb      | My Second Book Report                 |    75 |
-- | Samantha   | Russian Lit Through The Ages          |    94 |
-- | Samantha   | De Montaigne and The Art of The Essay |    98 |
-- | Raj        | NULL                                  |  NULL |
-- | Carlos     | Borges and Magical Realism            |    89 |
-- | Lisa       | NULL                                  |  NULL |
-- +------------+---------------------------------------+-------+
-- 7 rows in set (0.01 sec)

-- title missing 
-- grade 0

select first_name, ifnull(title, 'MISSING') as title, ifnull(grade, 0) as grade 
from students left join papers on students.id = papers.student_id;

-- mysql> select first_name, ifnull(title, 'MISSING') as title, ifnull(grade, 0) as grade 
--     -> from students left join papers on students.id = papers.student_id;
-- +------------+---------------------------------------+-------+
-- | first_name | title                                 | grade |
-- +------------+---------------------------------------+-------+
-- | Caleb      | My First Book Report                  |    60 |
-- | Caleb      | My Second Book Report                 |    75 |
-- | Samantha   | Russian Lit Through The Ages          |    94 |
-- | Samantha   | De Montaigne and The Art of The Essay |    98 |
-- | Raj        | MISSING                               |     0 |
-- | Carlos     | Borges and Magical Realism            |    89 |
-- | Lisa       | MISSING                               |     0 |
-- +------------+---------------------------------------+-------+
-- 7 rows in set (0.01 sec)

select first_name, ifnull(avg(grade), '0') as average
from students left join papers on students.id = papers.student_id 
group by first_name
order by grade desc;

-- group by students.id
-- order by average desc;

-- mysql> select first_name, ifnull(avg(grade), '0') as average
--     -> from students left join papers on students.id = papers.student_id 
--     -> group by first_name
--     -> order by grade desc;
-- +------------+---------+
-- | first_name | average |
-- +------------+---------+
-- | Samantha   | 96.0000 |
-- | Carlos     | 89.0000 |
-- | Caleb      | 67.5000 |
-- | Raj        | 0       |
-- | Lisa       | 0       |
-- +------------+---------+
-- 5 rows in set (0.00 sec)

select first_name, ifnull(avg(grade), '0') as average, 
    case 
        when avg(grade) > 75 then 'PASSING' 
        else 'FAILING' 
    end as 'passing_status'
from students left join papers on students.id = papers.student_id 
group by first_name
order by grade desc;

-- group by students.id
-- order by average desc;

-- avg(grade) >= 75

-- mysql> select first_name, ifnull(avg(grade), '0') as average, 
--     ->     case 
--     ->         when avg(grade) > 75 then 'PASSING' 
--     ->         else 'FAILING' 
--     ->     end as 'passing_status'
--     -> from students left join papers on students.id = papers.student_id 
--     -> group by first_name
--     -> order by grade desc;
-- +------------+---------+----------------+
-- | first_name | average | passing_status |
-- +------------+---------+----------------+
-- | Samantha   | 96.0000 | PASSING        |
-- | Carlos     | 89.0000 | PASSING        |
-- | Caleb      | 67.5000 | FAILING        |
-- | Raj        | 0       | FAILING        |
-- | Lisa       | 0       | FAILING        |
-- +------------+---------+----------------+
-- 5 rows in set (0.00 sec)







