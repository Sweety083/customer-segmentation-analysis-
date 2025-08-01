show databases;

select * from customer;

-- 1. How is the shopping distribution according to gender?
SELECT gender, COUNT(*) AS total_transactions
FROM customer
GROUP BY gender;

-- 2. Which gender did we sell more products to?
SELECT gender, SUM(quantity) AS total_products_sold
FROM customer
GROUP BY gender
ORDER BY total_products_sold DESC
LIMIT 1;

-- 3. Which gender generated more revenue?
SELECT gender, SUM(quantity * price) AS total_revenue
FROM customer
GROUP BY gender
ORDER BY total_revenue DESC
LIMIT 1;

-- 4. Distribution of purchase categories relative to other columns?
-- Categories by gender
SELECT category, gender, COUNT(*) as count
FROM customer
GROUP BY category, gender
ORDER BY category, count DESC;

-- 5. How is the shopping distribution according to age?
SELECT 
    CASE 
        WHEN age < 25 THEN '18-24'
        WHEN age < 35 THEN '25-34'
        WHEN age < 45 THEN '35-44'
        WHEN age < 55 THEN '45-54'
        ELSE '55+'
    END as age_group,
    COUNT(*) as transactions
FROM customer
GROUP BY age_group;

-- 6. Which age cat did we sell more products to?
SELECT 
    CASE 
        WHEN age < 25 THEN '18-24'
        WHEN age < 35 THEN '25-34'
        WHEN age < 45 THEN '35-44'
        WHEN age < 55 THEN '45-54'
        ELSE '55+'
    END as age_group,
    SUM(quantity) as total_products
FROM customer
GROUP BY age_group
ORDER BY total_products DESC;

-- 7. Which age cat generated more revenue?
SELECT 
    CASE 
        WHEN age < 25 THEN '18-24'
        WHEN age < 35 THEN '25-34'
        WHEN age < 45 THEN '35-44'
        WHEN age < 55 THEN '45-54'
        ELSE '55+'
    END as age_group,
    SUM(quantity * price) as total_revenue
FROM customer
GROUP BY age_group
ORDER BY total_revenue DESC;

-- 8. Distribution of purchase categories relative to other columns?
SELECT 
    category,
    CASE 
        WHEN age < 25 THEN '18-24'
        WHEN age < 35 THEN '25-34'
        WHEN age < 45 THEN '35-44'
        WHEN age < 55 THEN '45-54'
        ELSE '55+'
    END as age_group,
    COUNT(*) as count
FROM customer
GROUP BY category, age_group
ORDER BY category, count DESC;

-- 9. Does the payment method have a relation with other columns?
-- 9a. Payment method with gender
SELECT payment_method, gender, COUNT(*) as count
FROM customer
GROUP BY payment_method, gender;

-- 9b. Payment method with age
SELECT 
    payment_method,
    CASE 
        WHEN age < 25 THEN '18-24'
        WHEN age < 35 THEN '25-34'
        WHEN age < 45 THEN '35-44'
        WHEN age < 55 THEN '45-54'
        ELSE '55+'
    END as age_group,
    COUNT(*) as count
FROM customer
GROUP BY payment_method, age_group;

-- 9c. Payment method with category
SELECT payment_method, category, COUNT(*) as count
FROM customer
GROUP BY payment_method, category
ORDER BY payment_method, count DESC;

-- 10. How is the distribution of the payment method?
SELECT payment_method, COUNT(*) as transactions
FROM customer
GROUP BY payment_method
ORDER BY transactions DESC;
