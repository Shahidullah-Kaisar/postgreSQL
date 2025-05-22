-- =============================
-- Show current timestamp with time zone info
-- =============================
-- বর্তমান সময় দেখাবে (server-এর timezone অনুযায়ী)
SELECT now();

-- =============================
-- Create a table with two timestamp columns
-- =============================
-- ts   = timestamp WITHOUT time zone (local time ধরে)
-- tsz  = timestamp WITH time zone (actual zone-aware time)
CREATE TABLE timeZ (
    ts  TIMESTAMP WITHOUT TIME ZONE,
    tsz TIMESTAMP WITH TIME ZONE
);

-- =============================
-- Insert same datetime value into both columns
-- =============================
-- ts: just stores as-is (no zone logic)
-- tsz: stores with time zone awareness (internally UTC-তে রূপান্তর করে)
INSERT INTO timeZ VALUES ('2024-01-12 10:45:00', '2024-01-12 10:45:00');

-- =============================
-- View inserted data from timeZ table
-- =============================
SELECT * FROM timeZ;

-- =============================
-- Show current timestamp again
-- =============================
SELECT now();

-- =============================
-- Show only current date (no time)
-- =============================
SELECT CURRENT_DATE;

-- =============================
-- Convert now() to only date
-- =============================
SELECT now()::date;

-- =============================
-- Convert now() to only time
-- =============================
SELECT now()::time;

-- =============================
-- Show day of the year (1–365/366)
-- =============================
-- DDD format → জানুয়ারি 1 হলে 001, ডিসেম্বর 31 হলে 365 বা 366
SELECT to_char(now(), 'DDD');

-- =============================
-- Subtract interval from current date
-- =============================
-- ১ বছর ২ মাস আগের তারিখ
SELECT CURRENT_DATE - INTERVAL '1 year 2 month';

-- =============================
-- Calculate age from a birthdate
-- =============================
-- এখন থেকে 1995-07-29 পর্যন্ত কত বছর, মাস, দিন হয়েছে
SELECT age(CURRENT_DATE, '1995-07-29');

-- =============================
-- Show each student’s age (assuming students table has dob)
-- =============================
SELECT *, age(CURRENT_DATE, dob) FROM students;

-- =============================
-- Extract month part from a date
-- =============================
-- এখানে date হচ্ছে 2024-01-25 → month = 1
SELECT extract(month FROM '2024-01-25'::date);

-- =============================
-- Cast a character to BOOLEAN
-- =============================
-- 'n' মানে no → FALSE return করবে
-- 'y', 't', 'true' → TRUE
SELECT 'n'::BOOLEAN;
