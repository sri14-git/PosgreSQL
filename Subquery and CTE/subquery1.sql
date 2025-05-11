SELECT movie_name, movie_length
FROM movies
WHERE movie_length > (
  SELECT AVG(movie_length) FROM movies
);

SELECT director_id, first_name, last_name
FROM directors
WHERE director_id IN (
  SELECT director_id
  FROM movies
  GROUP BY director_id
  HAVING COUNT(*) > 1
);

SELECT movie_name
FROM movies
WHERE movie_id IN (
  SELECT movie_id
  FROM movies_revenues
  WHERE revenues_international > (
    SELECT AVG(revenues_international) FROM movies_revenues
  )
);


SELECT first_name, last_name, date_of_birth
FROM actors
WHERE date_of_birth = (
  SELECT MIN(date_of_birth) FROM actors
);
