select d.first_name, 
		d.last_name,
		mv.movie_name
	FROM directors d 
	LEFT JOIN movies mv on mv.director_id=d.director_id