-- Active: 1747422770417@@127.0.0.1@5432@test_db1

INSERT INTO person2 VALUES(3, 'kaisar', 30);
ALTER TABLE person2
    ADD COLUMN email VARCHAR(23) DEFAULT 'default@gmail.com' NOT NULL;

SELECT *FROM person2