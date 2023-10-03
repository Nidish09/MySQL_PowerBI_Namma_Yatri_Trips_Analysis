# 1. Total trips
select count(tripid) as total_trips from trip_details

# 2. Total drivers
select count(distinct(driverid)) total_drivers from trips

# 3. Total earnings
select sum(fare) total_earnings from trips

# 4. Total Completed trips
select count(tripid) as total_cmpl_trips from trips

# 5. total searches
select sum(searches),sum(searches_got_estimate),sum(searches_for_quotes),sum(searches_got_quotes),
sum(customer_not_cancelled),sum(driver_not_cancelled),sum(otp_entered),sum(end_ride)
from trips_details;

# 6. total driver cancelled
select count(*) - sum(driver_not_cancelled) as total_driver_cancelled from trips_details

# 7. average distance per trip
select round(avg(distance)) avg_dist from trips

# 8. average fare per trip
select avg(fare) from trips

# 9. distance travelled
select sum(distance) from trips

# 10. which is the most used payment method? 
select a.method from payment a inner join
(select faremethod, count(tripid) from trips
group by faremethod
order by count(tripid) desc
limit 1) b
on a.id = b.faremethod

# 11. the highest payment was made through which instrument
select a.method from payment a inner join
(select * from trips
order by fare desc limit 1) b
on a.id = b.faremethod

# 12, which two locations had the most trips
select loc_from, loc_to, count(loc_to) from trips
group by loc_from, loc_to
order by count(loc_to) desc
limit 2

# 13. top 5 earning drivers
select driverid, sum(fare) from trips
group by driverid
order by sum(fare) desc
limit 5