-- Active: 1747422770417@@127.0.0.1@5432@test_db1

-- ============================
-- Create "user" Table
-- ============================
-- এখানে একটি user টেবিল তৈরি করা হয়েছে
-- id: primary key এবং auto-increment (SERIAL)
-- username: 25 character পর্যন্ত নাম, ফাঁকা রাখা যাবে না
CREATE Table "user"(
    id SERIAL PRIMARY KEY,
    username VARCHAR(25) NOT NULL
);

-- ============================
-- Create post Table
-- ============================
-- post টেবিলে:
-- title: পোস্টের লেখা, null হতে পারবে না
-- user_id: user টেবিলের id এর উপর foreign key reference
-- on delete set DEFAULT: যদি user ডিলিট হয়, তাহলে পোস্টের user_id ডিফল্ট 2 হয়ে যাবে
CREATE Table post(
    id SERIAL PRIMARY KEY,
    title text NOT NULL,
    user_id INTEGER REFERENCES "user"(id) ON DELETE SET DEFAULT DEFAULT 2 
);

-- ============================
-- Enforce NOT NULL on user_id
-- ============================
-- এখন post টেবিলের user_id ফিল্ডে NULL রাখা যাবে না
-- মানে, সব post-এর সাথে কোনো না কোনো user লাগবেই
ALTER Table post
    ALTER COLUMN user_id SET NOT NULL;


-- ============================
-- Insert Sample Users
-- ============================
INSERT INTO "user" (username) VALUES
('akash'),
('batash'),
('sagor'),
('nodi');

-- ============================
-- Insert Sample Posts
-- ============================
-- প্রতিটা পোস্টের সাথে user_id দিয়ে বলা হচ্ছে কে করেছে
-- যেমন user_id = 2 মানে এটা batash এর পোস্ট
INSERT INTO post (title, user_id) VALUES
('Enjoying a sunny day with Akash! ☀️', 2),
('Batash just shared an amazing recipe! 🍲', 1),
('Exploring adventures with Sagor.🌟', 4),
('Nodi''s wisdom always leaves me inspired. 📚', 4);


-- ============================
-- Drop Tables (WARNING: data will be lost)
-- ============================
-- এই কমান্ডে দুইটা টেবিলই মুছে যাবে
DROP Table post;
DROP Table "user";


-- ============================
-- View All Data (Optional check)
-- ============================
SELECT * from "user";
SELECT * from post;

-- ============================
-- Insert Invalid Post (NULL user_id)
-- ============================
-- এখানে post এ user_id NULL দেয়া হয়েছে,
-- কিন্তু ALTER TABLE দিয়ে আগেই বলেছিলাম user_id NULL হতে পারবে না,
-- তাই এই insertion ব্যর্থ হবে (error দিবে)
INSERT INTO post (title, user_id) VALUES('test', NULL);


-- ===========================================
-- Deletion constraint on DELETE user
-- ===========================================
-- নিচের DELETE query একজন user (id = 4) কে মুছে দিচ্ছে
-- যেহেতু post টেবিল এ তার পোস্ট আছে, delete হলে user_id এর ভ্যালু DEFAULT (2) হয়ে যাবে
-- কারণ ON DELETE SET DEFAULT ব্যবহার করা হয়েছে
DELETE FROM "user" 
    WHERE id = 4;


-- ====================================================
-- FOREIGN KEY DELETE BEHAVIOR SUMMARY
-- ====================================================
-- ON DELETE RESTRICT / NO ACTION (default)  → user delete করা যাবে না, যদি তার পোস্ট থাকে
-- ON DELETE CASCADE              → user delete হলে তার সব পোস্টও delete হবে
-- ON DELETE SET NULL             → user delete হলে post.user_id null হয়ে যাবে
-- ON DELETE SET DEFAULT          → user delete হলে post.user_id default (যেমন: 2) হয়ে যাবে
