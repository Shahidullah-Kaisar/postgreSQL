-- Active: 1747422770417@@127.0.0.1@5432@test_db1

-- ===============================
-- Show All Student Records
-- ===============================
-- students টেবিলের সব রো দেখাবে
SELECT * from students;


-- ============================================
-- Group By Country: Count and Average Age
-- ============================================
-- প্রতিটা country অনুযায়ী গ্রুপ করে,
-- সেখানে কতজন student আছে (count(*)) এবং তাদের গড় বয়স (avg(age)) দেখায়
-- উদাহরণ:
-- যদি Bangladesh থেকে 3 জন student থাকে, তাদের গড় বয়স 22 হয়,
-- তাহলে output: Bangladesh | 3 | 22.0
SELECT country, count(*), avg(age) 
    FROM students 
    GROUP BY country;


-- =================================================
-- Group By Country and Filter Using HAVING
-- =================================================
-- আগের মতোই country অনুযায়ী group করছে,
-- কিন্তু এবার HAVING দিয়ে এমন group রাখছে যাদের গড় বয়স 20.60-এর বেশি
-- HAVING clause হচ্ছে WHERE-এর মতো, কিন্তু এটা aggregate result (যেমন avg()) এর উপর কাজ করে
-- যেমন: India-এর avg(age) যদি 21.3 হয়, তবে সেটা থাকবে; যদি 19.5 হয়, তবে থাকবে না
SELECT country, avg(age) 
    FROM students 
    GROUP BY country
    HAVING avg(age) > 20.60;


-- ===================================================================
-- Same HAVING clause but with unrealistic high average (220.60)
-- ===================================================================
-- এই query আগের মতই, কিন্তু এখানে avg(age) > 220.60
-- যেহেতু কোন student-এর বয়স সাধারণত 220 না, তাই এই query result এ কিছুই দেখাবে না
-- এটা দেখায় যে HAVING ব্যবহার করে আমরা কোন group filter করতে পারি
SELECT country, avg(age) 
    FROM students 
    GROUP BY country
    HAVING avg(age) > 220.60;


-- ======================================
-- Count Students Born in Each Year
-- ======================================
-- extract(year from dob): জন্মতারিখ (dob) থেকে শুধু বছর বের করে
-- তারপর সেই birth_year অনুযায়ী গ্রুপ করে count করছে
-- উদাহরণ: যদি 2002 সালে 5 জন জন্মগ্রহণ করে, তাহলে:
-- birth_year | count  
--     2002   |   5
SELECT extract(year from dob) as birth_year, count(*) 
    FROM students 
    GROUP BY birth_year;
