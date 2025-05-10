CREATE INDEX idx_users_email
ON users(email); ---Btreee


CREATE UNIQUE INDEX idx_users_username
ON users(username); ---Btreee ( Best for: equality (=), range queries (<, >, BETWEEN), and sorting)

CREATE INDEX idx_name_hash
ON employees USING HASH (name); --Hash Index (Best for: equality comparisons
								 --(= only), faster than B-tree in some cases)

CREATE INDEX idx_attrs_gin ON products USING GIN (attributes);---- GIN index Best for Json

CREATE INDEX idx_time_brin ON sensor_data USING BRIN (reading_time);----BRIN Index Best for: large, 
---append-only tables with naturally ordered data (e.g., timestamps, IDs).

-- | Index Type | Use Case                         | Supports Range? | Supports Equality? | Special Use            |
-- | ---------- | -------------------------------- | --------------- | ------------------ | ---------------------- |
-- | B-tree     | Default, general-purpose         | ✅               | ✅                  | —                      |
-- | Hash       | Fast equality checks             | ❌               | ✅                  | Simple lookups         |
-- | GIN        | `jsonb`, `array`, full-text      | ❌               | ✅                  | Inverted indexing      |
-- | GiST       | Geometric, full-text, ranges     | ✅               | ✅                  | Spatial data           |
-- | SP-GiST    | Partitioned spaces (e.g., IPs)   | ✅               | ✅                  | Advanced structures    |
-- | BRIN       | Huge ordered tables (timestamps) | ✅               | ✅                  | Compressed block index |


