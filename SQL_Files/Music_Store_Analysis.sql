USE musicstore;
-- Checking Tables after Data insertion.
SELECT * FROM genre;
SELECT * FROM mediatype;
SELECT * FROM employee;
SELECT * FROM customer;
SELECT * FROM  artist;
SELECT * FROM album;
SELECT * FROM track;
SELECT * FROM invoice;
SELECT * FROM invoiceline;
SELECT * FROM playlist;
SELECT * FROM playlisttrack;

-- Q1: Who is the senior most employee based on the Job title?
SELECT CONCAT(last_name," ",first_name) AS full_name,title FROM employee
ORDER BY levels DESC
LIMIT 1;

-- Q2: Which countries have the most invoices?
SELECT billing_country, COUNT(*) AS invoice_count
FROM Invoice
GROUP BY billing_country
ORDER BY invoice_count DESC;

-- Q3: What are top three values of invoices?
SELECT customer_id,total FROM invoice
ORDER BY total DESC
LIMIT 3;

-- Q4: Which city has the best customers? We would like to throw a promotional MusicFestival in the city we made the most money.
-- Write a query that returns one city that has the highest sum of invoice totals.
-- Return both the city name and sum of all invoice totals.
SELECT billing_city, SUM(total) AS invoice_total
FROM Invoice
GROUP BY billing_city
ORDER BY invoice_total DESC
LIMIT 1;

-- Q5: Who is the best customer?
-- The customer  who has spent the most money will be declared the best customer.
-- Write a query that returns the person who has spent the most money.

SELECT c.Customer_id,
CONCAT_WS(" ",c.first_name,c.last_name) AS Customer_Name, 
SUM(invoice.total) AS Total
FROM customer c
JOIN invoice ON c.customer_id = invoice.customer_id
GROUP BY c.customer_id
ORDER BY total DESC
LIMIT 1;

-- Q6: Write a query to return the email, first name, last name and Genre of all Rock music listeners.
-- Return your list ordered alphabetically by email starting with A.
SELECT DISTINCT c.Email,CONCAT(c.First_Name," ",c.Last_name)
 AS Customer_Name,g.name AS genre FROM Customer c 
JOIN Invoice i ON c.customer_id = i.customer_id
JOIN InvoiceLine il ON i.invoice_id = il.invoice_id
JOIN Track t ON il.track_id = t.track_id
JOIN Genre g ON t.genre_id = g.genre_id
WHERE g.name = 'Rock'
ORDER BY c.email;

-- Q7: Lets invite the artists who have written the most rock music in our dataset.
-- Write a query that returns the Artist name and total track count of the top 10 rock bands.
SELECT a.artist_id, a.name, 
COUNT(*) AS no_of_songs FROM Track t
JOIN Album al ON t.album_id = al.album_id
JOIN Artist a ON al.artist_id = a.artist_id
JOIN Genre g ON t.genre_id = g.genre_id
WHERE g.name = 'Rock'
GROUP BY a.artist_id
ORDER BY no_of_songs DESC
LIMIT 10;

-- Q8: Return all the track names that have a song length longer than the average song length.
-- Return the Name and Milliseconds for each track.
-- Order by the song length with the longest songs listed first.
SELECT name,milliseconds FROM Track
WHERE milliseconds > (
    SELECT AVG(milliseconds) 
    FROM Track)
ORDER BY milliseconds DESC;

-- Q9: Find how much amount spent by each customer on artists?
-- Write a query to return customer name, artist name and total spent.
SELECT CONCAT_WS(' ',c.first_name,c.last_name) AS Customer_Name,
a.name AS Artist_Name, SUM(i.total) AS Total_Spent
FROM customer c
JOIN invoice i ON c.customer_id = i.customer_id
JOIN invoiceline il ON i.invoice_id = il.invoice_line_id
JOIN track t ON il.track_id = t.track_id
JOIN album al ON t.album_id = al.album_id
JOIN artist a ON al.artist_id = a.artist_id
GROUP BY Customer_Name , Artist_Name
ORDER BY Total_Spent DESC;

-- Q10: We want to find out the most popular music genre for each country.
-- We determine the most popular genre as the genre with highest amount of purchases.
-- Write a query that returns each country along with the top genre.
-- For countries where the maximum number of purchases is shared return all genres.

WITH popular_genre AS 
(SELECT COUNT(il.quantity) AS purchases,
c.country,g.name AS genre_name,g.genre_id,
ROW_NUMBER() OVER(PARTITION BY c.country 
ORDER BY COUNT(il.quantity) DESC) AS RowNo
FROM InvoiceLine il
JOIN Invoice i   ON i.invoice_id = il.invoice_id
JOIN Customer c  ON c.customer_id = i.customer_id
JOIN Track t     ON t.track_id = il.track_id
JOIN Genre g     ON g.genre_id = t.genre_id
GROUP BY c.country, g.name, g.genre_id
) 
SELECT * FROM popular_genre WHERE rowno<=1;

 -- Q11: Write a query that determines the customer that has spent the most on music for each ciuntry.
 -- Write a query that returns the country along with the top customer and how much they spent.
 -- For countries where the top amount spentis shared, provide all customers who spent this amount
 WITH customer_with_country AS(
	SELECT customer.customer_id, first_name, last_name, billing_country, SUM(total) AS total_spending,
	 ROW_NUMBER() OVER (PARTITION BY billing_country
	 ORDER BY SUM(total) DESC) AS RowNo
	 FROM invoice
	 JOIN customer ON customer.customer_id= invoice.customer_id
	 GROUP BY 1,2,3,4
	 ORDER BY 4 ASC, 5 DESC)
SELECT * FROM customer_with_country WHERE RowNo <= 1;
