CREATE TABLE tasks (id serial PRIMARY KEY, title text NOT NULL);
INSERT INTO tasks (title) VALUES ('seeded one'), ('seeded two');
