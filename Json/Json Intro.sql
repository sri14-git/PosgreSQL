CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  info JSONB
);

INSERT INTO users (info)
VALUES ('{"name": "Alice", "age": 30, "skills": ["SQL", "Python"]}');

SELECT info->>'name' FROM users;  -- Returns 'Alice'
SELECT info->'skills' FROM users;

SELECT * FROM users
WHERE info @> '{"age": 30}';

SELECT * FROM users
WHERE info ? 'skills';  -- Checks if the key exists

SELECT info ?& ARRAY['name', 'skills'] FROM users -- TRUE only if *both* exist

