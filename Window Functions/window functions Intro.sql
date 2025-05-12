SELECT 
  d.first_name || ' ' || d.last_name AS director_name,
  m.movie_name,
  r.revenues_domestic,
  RANK() OVER (
    PARTITION BY m.director_id 
    ORDER BY r.revenues_domestic DESC
  ) AS revenue_rank
FROM movies m
JOIN movies_revenues r ON m.movie_id = r.movie_id
JOIN directors d ON m.director_id = d.director_id;

SELECT 
  m.movie_name,
  r.revenues_domestic,
  SUM(r.revenues_domestic) OVER (
    ORDER BY r.revenues_domestic
  ) AS running_domestic_total
FROM movies m
JOIN movies_revenues r ON m.movie_id = r.movie_id;


SELECT 
  movie_id,
  revenues_domestic,
  LAG(revenues_domestic) OVER (ORDER BY movie_id) AS previous_movie_revenue
FROM movies_revenues;


SELECT 
  first_name,
  last_name,
  date_of_birth,
  LAG(date_of_birth) OVER (ORDER BY date_of_birth) AS prev_actor_dob
FROM actors;

SELECT 
  d.director_id,
  d.first_name || ' ' || d.last_name AS director_name,
  COUNT(*) OVER (PARTITION BY d.director_id) AS movie_count
FROM movies m
JOIN directors d ON m.director_id = d.director_id;

