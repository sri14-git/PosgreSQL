CREATE FUNCTION get_full_name(first TEXT, last TEXT)
RETURNS TEXT AS $$
    SELECT first || ' ' || last;
$$ LANGUAGE SQL;

SELECT get_full_name(first_name, last_name) FROM actors;


CREATE FUNCTION total_revenue(dom NUMERIC, intl NUMERIC)
RETURNS NUMERIC AS $$
    SELECT dom + intl;
$$ LANGUAGE SQL;

SELECT total_revenue(revenues_domestic, revenues_international)
FROM movies_revenues;


CREATE FUNCTION movie_age(release_date DATE)
RETURNS INT AS $$
    SELECT DATE_PART('year', CURRENT_DATE) - DATE_PART('year', release_date);
$$ LANGUAGE SQL;


CREATE FUNCTION get_movie_details(mid INT)
RETURNS TABLE (name TEXT, release DATE) AS $$
    SELECT movie_name, release_date FROM movies WHERE movie_id = mid;
$$ LANGUAGE SQL;


SELECT * FROM get_movie_details(1);


CREATE FUNCTION get_movies_by_director(did INT)
RETURNS TABLE (movie_id INT, movie_name TEXT, release_date DATE) AS $$
    SELECT movie_id, movie_name, release_date
    FROM movies
    WHERE director_id = did;
$$ LANGUAGE SQL;


SELECT * FROM get_movies_by_director(3);



CREATE FUNCTION get_recent_movies()
RETURNS SETOF movies AS $$
    SELECT * FROM movies WHERE release_date > '2017-01-01';
$$ LANGUAGE SQL;


SELECT * FROM get_recent_movies();


-- | Syntax                  | Valid When?                                       |
-- | ----------------------- | ------------------------------------------------- |
-- | `SELECT get_func().*;`  | Only if function returns **single row**           |
-- | `SELECT * FROM func();` | For functions returning **multiple rows (SETOF)** |

-- | Partitioning Type             | Use case                                                 |
-- | ----------------------------- | -------------------------------------------------------- |
-- | `PARTITION BY RANGE (column)` | Continuous numeric or date values (e.g., `release_date`) |
-- | `PARTITION BY LIST (column)`  | Discrete categories (e.g., `director_id`, `nationality`) |
-- | `PARTITION BY HASH (column)`  | Uniform distribution (e.g., `movie_id`)                  |
-- | Composite partitioning        | When one column isn’t enough for distinct partitioning   |
