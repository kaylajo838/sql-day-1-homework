-- 1. How many actors are there with the last name ‘Wahlberg’?
SELECT last_name
FROM actor
WHERE last_name = 'Wahlberg';

-- ANSWER: 2



-- ------------------------------------------------------------------------------------------------------------------------



-- 2. How many payments were made between $3.99 and $5.99?
SELECT amount
FROM payment
WHERE amount BETWEEN 3.99 AND 5.99;

-- ANSWER: 4794



-- ------------------------------------------------------------------------------------------------------------------------



-- 3. What film does the store have the most of? (search in inventory table)
SELECT film_id, COUNT(film_id)
FROM inventory
GROUP BY film_id
--ORDER BY COUNT(film_id) DESC
HAVING COUNT(film_id) = 8;

-- There are 72 titles that the store has most of, which is 8 copies of each. 
-- The count of these films are 8 each. 
-- I left the ORDER BY in my code and commented out to show my thought process. 
-- The ORDER BY COUNT(film_id) DESC showed me that the top count of the film_id was 8.
-- I then took that information, and did HAVING COUNT(film_id) = 8 to show only the films that had 8.
-- That then return the film_id's that had 8, giving me all the top titles in the inventory.



-- ------------------------------------------------------------------------------------------------------------------------



-- 4. How many customers have the last name ‘William’?
SELECT last_name
FROM customer
WHERE last_name = 'William';

-- ANSWER: 0



-- ------------------------------------------------------------------------------------------------------------------------



-- 5. What store employee (get the id) sold the most rentals?
SELECT MAX(staff_id), COUNT(rental_id)
FROM rental
GROUP BY staff_id;

-- ANSWER: 1



-- ------------------------------------------------------------------------------------------------------------------------



-- 6. How many different distinct names are there?
SELECT COUNT(DISTINCT name)
FROM category;

-- ANSWER: 16, from category table


SELECT COUNT(DISTINCT first_name)
FROM staff;

-- ANSWER: 2, from staff table


SELECT COUNT(DISTINCT first_name)
FROM actor;

-- ANSWER: 140, from actor table


SELECT COUNT(DISTINCT first_name)
FROM customer;

-- ANSWER: 591, from customer table

-- ANSWER: total of 733 distinct names between staff, actor, and customer tables


-- ------------------------------------------------------------------------------------------------------------------------




-- 7. What film has the most actors in it? (use film_actor table and get film_id)
SELECT film_id, COUNT(actor_id)
FROM film_actor
GROUP BY film_id
ORDER BY COUNT(actor_id) DESC;

-- ANSWER: film_id 508 has 15 actors



-- ------------------------------------------------------------------------------------------------------------------------



-- 8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
SELECT COUNT(last_name), store_id
FROM customer
WHERE last_name LIKE '%es'
GROUP BY store_id;

-- ANSWER: 13



-- ------------------------------------------------------------------------------------------------------------------------



-- 9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
-- with ids between 380 and 430? (use group by and having > 250)

SELECT COUNT(amount), amount
FROM payment
WHERE customer_id BETWEEN 380 AND 430
GROUP BY amount
HAVING COUNT(amount) > 250;


-- ANSWER: 3
-- 2.99 269 times
-- 6.99 281 times
-- 4.99 290 times


-- ------------------------------------------------------------------------------------------------------------------------


-- 10. Within the film table, how many rating categories are there? And what rating has the most
-- movies total?
SELECT rating, COUNT(title)
FROM film
GROUP BY rating
ORDER BY COUNT(title) DESC;

-- ANSWER: 5 rating categories, PG-13 has the most movies total

