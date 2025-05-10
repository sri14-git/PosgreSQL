SELECT unnest(ARRAY[1,2,3])
-- ARRAY TO ROWS

select cardinality(ARRAY[[1,2],[3,4]]) → 4
-- Returns total number of elements in all dimensions

select array_upper(ARRAY[1,2,3], 1)
-- Index of the highest element in the given dimension

select array_position(ARRAY['a','b','c'], 'b')
-- Returns the position of the first matching element




