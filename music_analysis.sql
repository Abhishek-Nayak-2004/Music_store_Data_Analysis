--who is the senior most employee based on job title ?
select *from employee 
order by levels desc
limit 1;

--which country have the most invoices
select billing_country from invoice 
group by billing_country
order by count(billing_country) desc
limit 1;

--what are the top 3 values of totalinvoices
select*from invoice
order by total desc
limit 3;

--which city has the best cusotmers? we would like to throw a promotional music
--festival in the city we made the most money write a query that returns one city
--that has the highest sum of invoices total return both the city,name and sum of all invoices
select sum(total)as inovice_total,billing_city
from invoice
group by billing_city
order by invoice_total desc;

--who is the best customer ? who has the spent the most money will be declared the best customer
--write a query that returns the person who has spent the most money
select c.customer_id,c.first_name,c.last_name,sum(i.total) as total
from customer as c
join invoice as i on 
c.customer_id = i.customer_id
group by c.customer_id
order by total desc
limit 1

--write a query to return the email,first_name,last_name and genre of all rock music
--listeners then return your list ordered alphabatically by email starting with A
select distinct email,first_name,last_name
from customer as c
join invoice as i on c.customer_id = i.customer_id
join invoice_line as il on i.invoice_id = il.invoice_id
where track_id in(
select track_id from track join genre
on track.genre_id = genre.genre_id
where genre.name like 'Rock'
)
order by email;

--lets invite the artist who have return the most rock music in our dataset write
--a query that returns the artist name and total track count of top 10 rock bands

select a.artist_id,a.name,count(a.artist_id) as number_of_songs
from track t
join album alb on alb.album_id = t.album_id
join artist as a on a.artist_id = alb.artist_id
join genre g on g.genre_id = t.genre_id
where g.name like 'Rock'
group by a.artist_id
order by number_of_songs desc
limit 10;

--return all the track names that have a song length longer then the average song length
--return the name and milliseconds for each track order by the songs with the longest 
--songs listed first
select name,milliseconds
from track
where milliseconds >(
select avg(milliseconds) as avg_track_length
from track
)order by milliseconds desc;


-- find how much amount spent by each customer on artist wirte a query
--to return customer name,artist name and total spent
with best_selling_artist as(
select artist.artist_id as artist_id,artist.name as artist_name,sum(invoice_line.unit_price*invoice_line.quantity) as total_spent
from invoice_line
join track on track.track_id = invoice_line.track_id
join album on album.album_id = track.album_id
join artist on artist.artist_id = album.artist_id
group by 1
order by 3 desc
limit 1
)

select c.customer_id,c.first_name,c.last_name,bsa.artist_name,sum(il.unit_price*il.quantity) as amount_spent
from invoice i
join customer c on c.customer_id = i.customer_id
join invoice_line il on il.invoice_id = i.invoice_id
join track t on t.track_id = il.track_id
join album alb on alb.album_id = t.album_id
join best_selling_artist as bsa on bsa.artist_id = alb.artist_id
group by 1,2,3,4
order by 5 desc;

--we want to find out the most popular music genre for each country
--we determine the most popular genre as the genre with the highest amount of purchase
--write a query that returns each country along with the top genre 
--for countries where the maximum num of purchase

with popular_genre as (
select count(invoice_line.quantity) as purchases,customer.country,genre.name,genre.genre_id,
row_number() over(partition by customer.country order by count(invoice_line.quantity)desc)as row_no
from invoice_line
join invoice on invoice.invoice_id = invoice_line.invoice_id
join customer on customer.customer_id = invoice.customer_id
join track on track.track_id = invoice_line.track_id
join genre on genre.genre_id = track.genre_id
group by 2,3,4
order by 2 asc,1 desc
) 
select*from popular_genre where row_no<=1

--write a query that determines the customer that has spent the most on music for each
--country write a query that returns the country along with the top customer and how
--much they spent. for countries where the top amount spent is shared, provide all customers who 
--spent the amount
with customer_with_country as (
select customer.customer_id,first_name,last_name,billing_country,sum(total)as total_spending,
row_number() over(partition by billing_country order by sum(total)desc)as row_no
from invoice
join customer on customer.customer_id = invoice.customer_id
group by 1,2,3,4
order by 4 asc,5 desc
)
select*from customer_with_country where row_no <=1







