-- Active: 1747422770417@@127.0.0.1@5432@test_db2
-- মূল employees টেবিল থেকে সব ডেটা দেখা
SELECT * from employees;

-- একটি View তৈরি করা হচ্ছে যার নাম dept_avg_salary
-- এখানে প্রতিটি ডিপার্টমেন্টের গড় (average) বেতন (salary) দেখানো হবে
CREATE View dept_avg_salary
AS
SELECT department_name, avg(salary) 
FROM employees 
GROUP BY department_name; 

-- এখন এই view থেকে সব ডেটা দেখা হবে
-- এটি মূলত প্রতিটি ডিপার্টমেন্টের গড় বেতন দেখাবে
SELECT * from dept_avg_salary;

-- আরেকটি View তৈরি করা হচ্ছে যার নাম test_view
-- এখানে সেই সব এমপ্লয়ীদের নাম, বেতন ও ডিপার্টমেন্ট দেখানো হবে
-- যাদের ডিপার্টমেন্টের নামের মধ্যে 'R' অক্ষরটি রয়েছে
CREATE View test_view
AS
SELECT employee_name, salary, department_name 
FROM employees 
WHERE department_name in 
(SELECT department_name 
 FROM employees 
 WHERE department_name LIKE '%R%');

-- এখন test_view থেকে সব ডেটা দেখা হবে
-- এটি শুধুমাত্র সেই এমপ্লয়ীদের তথ্য দেখাবে যাদের ডিপার্টমেন্টে 'R' রয়েছে
SELECT * from test_view;


-- নিচে View ব্যবহারের সুবিধা নিয়ে কিছু পয়েন্ট:

-- জটিল query সহজ করা যায় (Simplifying complex queries)
-- নিরাপত্তা উন্নত করা যায় (Improved security)
-- ডেটার বিমূর্ততা বাড়ানো যায় (Enhanced data abstraction)

