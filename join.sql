-- "user" নামের টেবিল তৈরি করা হচ্ছে, যেখানে প্রতিটি ইউজারের জন্য একটি id এবং username থাকবে
CREATE TABLE "user" (
    id SERIAL PRIMARY KEY,           -- স্বয়ংক্রিয়ভাবে বাড়তে থাকা id (primary key)
    username VARCHAR(25) NOT NULL    -- ইউজারের নাম, খালি রাখা যাবে না
);

-- "post" নামের টেবিল তৈরি করা হচ্ছে, যেখানে প্রতিটি পোস্টের জন্য একটি id, title এবং user_id থাকবে
CREATE TABLE post (
    id SERIAL PRIMARY KEY,           -- স্বয়ংক্রিয়ভাবে বাড়তে থাকা id (primary key)
    title TEXT NOT NULL,             -- পোস্টের টাইটেল, খালি রাখা যাবে না
    user_id INTEGER REFERENCES "user"(id)  -- কোন ইউজার পোস্ট করেছে তা বোঝাতে foreign key
);

-- কিছু ইউজার ডাটা ঢোকানো হচ্ছে "user" টেবিলে
INSERT INTO "user" (username) VALUES
('akash'),
('batash'),
('sagor'),
('nodi');

-- কিছু পোস্ট ডাটা ঢোকানো হচ্ছে post টেবিলে
-- প্রতিটি পোস্টের সাথে user_id যুক্ত করা হয়েছে, যাতে বোঝা যায় কে পোস্ট করেছে
INSERT INTO post (title, user_id) VALUES
('Enjoying a sunny day with Akash! ☀️', 2),
('Batash just shared an amazing recipe! 🍲', 1),
('Exploring adventures with Sagor.🌟', 4),
('Nodi''s wisdom always leaves me inspired. 📚', 4);

-- সব ইউজার দেখতে SELECT
SELECT * FROM "user";

-- সব পোস্ট দেখতে SELECT
SELECT * FROM post;

-- INNER JOIN: শুধুমাত্র সেই পোস্টগুলো দেখাবে যেগুলোর সাথে মিল আছে ইউজার টেবিলে (user_id = id)
SELECT * FROM post AS p
JOIN "user" u ON p.user_id = u.id;

-- একটি নতুন পোস্ট ইনসার্ট করা হচ্ছে যার user_id NULL
-- এতে বোঝা যাবে, পোস্টটি কে করেছে তা জানা যায়নি
INSERT INTO post (id, title, user_id) VALUES
(5, 'this is a test post title', NULL);

-- j table select er sathe FROM er pore thakbe seta left r jeta join korbo seta all time right.

-- LEFT OUTER JOIN: সব পোস্ট(post table) দেখাবে, এমনকি যাদের user_id NULL বা মিল খুঁজে পায়নি.
--post AS p → এটিই FROM ক্লজে প্রথমে আছে, তাই এটা left table 
--"user" টেবিলকে LEFT OUTER JOIN এর মাধ্যমে যোগ করা হয়েছে...এটি right table

SELECT * FROM post AS p
LEFT OUTER JOIN "user" u ON p.user_id = u.id;



-- RIGHT OUTER JOIN: সব ইউজার(user dekhabe) দেখাবে, এমনকি যাদের কোনো পোস্ট নেই.
-- post AS p → এটিই FROM ক্লজে প্রথমে আছে, তাই এটা left table 
-- "user" টেবিলকে RIGHT OUTER JOIN এর মাধ্যমে যোগ করা হয়েছে...এটি right table
SELECT * FROM post AS p
RIGHT OUTER JOIN "user" u ON p.user_id = u.id;


-- FULL OUTER JOIN: সব পোস্ট এবং সব ইউজার দেখাবে, মিল থাকুক বা না থাকুক
SELECT * FROM post AS p
FULL OUTER JOIN "user" u ON p.user_id = u.id;
