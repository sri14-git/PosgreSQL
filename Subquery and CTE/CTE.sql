WITH avg_length AS (
  SELECT AVG(movie_length) AS avg_len
  FROM movies
)
SELECT movie_name, movie_length
FROM movies, avg_length
WHERE movie_length > avg_length.avg_len;

WITH total_revenue AS (
  SELECT movie_id, 
         revenues_domestic + revenues_international AS total
  FROM movies_revenues
)
SELECT m.movie_name, tr.total
FROM total_revenue tr
JOIN movies m ON m.movie_id = tr.movie_id;

WITH movie_count AS (
  SELECT director_id, COUNT(*) AS total_movies
  FROM movies
  GROUP BY director_id
)
SELECT d.first_name, d.last_name, mc.total_movies
FROM directors d
JOIN movie_count mc ON d.director_id = mc.director_id;



