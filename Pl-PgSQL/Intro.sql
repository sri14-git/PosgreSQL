CREATE FUNCTION check_rating(rating INT)
RETURNS TEXT AS $$
BEGIN
    IF rating > 8 THEN
        RETURN 'Excellent';
    ELSIF rating >= 5 THEN
        RETURN 'Average';
    ELSE
        RETURN 'Poor';
    END IF;
END;
$$ LANGUAGE plpgsql;

select check_rating(1)

CREATE FUNCTION sum_upto(n INT)
RETURNS INT AS $$
DECLARE
    total INT := 0;
    i INT;
BEGIN
    FOR i IN 1..n LOOP
        total := total + i;
    END LOOP;
    RETURN total;
END;
$$ LANGUAGE plpgsql;


select sum_upto(3)


CREATE FUNCTION numbers_upto(n INT)
RETURNS SETOF INT AS $$
DECLARE
    i INT;
BEGIN
    FOR i IN 1..n LOOP
        RETURN NEXT i;
    END LOOP;
END;
$$ LANGUAGE plpgsql;


select numbers_upto(3)



CREATE OR REPLACE FUNCTION get_high_revenue()
RETURNS TABLE(movieid INT, total NUMERIC) AS $$
BEGIN
    RETURN QUERY
    SELECT movie_id, revenues_domestic + revenues_international
    FROM movies_revenues
    WHERE revenues_domestic > 100;
END;
$$ LANGUAGE plpgsql;

DROP FUNCTION get_high_revenue

select * from get_high_revenue()

