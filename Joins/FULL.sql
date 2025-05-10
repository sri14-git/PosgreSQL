select
	d.first_name,
	d.last_name,

	mv.movie_name,
	mv.movie_lang
FROM movies mv
FULL JOIN directors d ON mv.director_id = d.director_id
WHERE 
	mv.movie_lang IN ('English','Chinese')
	