-- create database customer_behaviour
-- use customer_behaviour
-- select * from output limit 5;

-- Q1. what is the total revenue genrated by male vs female customers?
-- SELECT gender, SUM(purchase_amount) AS revenue FROM output GROUP BY gender;


-- Q2. which customers used discounts but still spent more than the average purchase amount?
-- SELECT customer_id, purchase_amount FROM output WHERE discount_applied = 'Yes' AND purchase_amount >= (select avg(purchase_amount) FROM output)


-- Q3. Which are the top 5 products with highest average review rating
-- SELECT item_purchased, ROUND(AVG(review_rating),2) AS average_rating FROM output GROUP BY item_purchased
-- ORDER BY average_rating DESC LIMIT 5;


-- Q4. Compare the average Purchase amounts between Standard and express shipping
-- select shipping_type, avg(purchase_amount) from output 
-- where shipping_type in ('Standard', 'Express') group by shipping_type


-- Q5. Do subscribed customers spend more? COmpare average spend and total revenue between subscribers and non subscribers.
-- select subscription_status, count(customer_id) as total_customers, 
-- avg(purchase_amount) as avg_spend, sum(purchase_amount) as total_revenue 
-- from output group by subscription_status order by total_revenue, avg_spend desc;


-- Q6. which 5 products have the highest percentage of purchases with discounts applied?
-- select item_purchased , sum(100 * case when discount_applied = 'Yes' then 1 else 0 end)/count(*) as discount_rate	
-- from output group by item_purchased order by discount_rate desc limit 5

-- Q7. segment customers into new, returning, and loyal based on their total number of previous purchases, and show count of each segment
-- SELECT 
    -- SUM(CASE WHEN previous_purchases <= 15 THEN 1 ELSE 0 END) AS newer,
    -- SUM(CASE WHEN previous_purchases BETWEEN 16 AND 40 THEN 1 ELSE 0 END) AS returning,
    -- SUM(CASE WHEN previous_purchases >= 41 THEN 1 ELSE 0 END) AS loyal
-- FROM output;

