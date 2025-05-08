CREATE DOMAIN rgb_colours VARCHAR(6)
CHECK (LOWER(VALUE) IN ('red','green','blue'))


