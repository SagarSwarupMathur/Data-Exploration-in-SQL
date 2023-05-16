use mavenmovies;

-- Write a SQL query to count the number of characters except the spaces for each actor. Return first 10 actors name length along with their name. 
SELECT actor_id, CONCAT(first_name,' ',last_name) AS Actor_Name, LENGTH(CONCAT(first_name,' ',last_name)) AS Length_of_Name 
FROM actor 
ORDER BY actor_id LIMIT 10;

-- List all Oscar awardees(Actors who received Oscar award) with their full names and length of their names. 
SELECT CONCAT(first_name,' ',last_name) AS Actor_Name, LENGTH(CONCAT(first_name,' ',last_name)) AS Length_of_Name 
FROM actor_award 
WHERE awards = 'Oscar'; 

-- Find the actors who have acted in the film 'Frost Head'. 
SELECT CONCAT(a.first_name,' ',a.last_name) AS Actor_Name 
FROM film AS f
INNER JOIN film_actor AS fa 
ON fa.film_id=f.film_id
INNER JOIN actor AS a 
ON a.actor_id=fa.actor_id
WHERE title = 'Frost Head';

-- Pull all the films acted by the actor 'Will Wilson'.
SELECT CONCAT(a.first_name,' ',a.last_name) AS Actor_Name, f.title 
FROM film AS f
INNER JOIN film_actor AS fa 
ON fa.film_id=f.film_id
INNER JOIN actor AS a 
ON a.actor_id=fa.actor_id
WHERE a.first_name ='Will' AND a.last_name = 'Wilson';

-- Pull all the films which were rented and return in the month of May.
SELECT title,rental_date,return_date 
FROM film AS f 
INNER JOIN inventory AS i 
ON i.film_id=f.film_id
INNER JOIN rental AS r 
ON i.inventory_id=r.inventory_id
WHERE rental_date LIKE '2005-05%' AND return_date LIKE '2005-05%';

-- Pull all the films with 'Comedy category.
SELECT title, c.name 
FROM film AS f 
INNER JOIN film_category AS fc 
ON fc.film_id=f.film_id
INNER JOIN category AS c 
ON c.category_id=fc.category_id
WHERE c.name = 'Comedy';