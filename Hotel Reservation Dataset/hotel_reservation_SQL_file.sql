create database mentor1;
use mentor1;

select * from hotel;

# 1 - total reservaation
select count(*) from hotel;

# 2 - best meal plan
select type_of_meal_plan,count(Booking_ID) 
from hotel 
group by type_of_meal_plan limit 1;

# 3 - avg price per room
select avg(avg_price_per_room) 
AS average_room_price from hotel where no_of_children >= 1;

# 4 - How many reservations were made for the year 20XX
select year(str_to_date(arrival_date, "%d-%m-%y"))as Year,
count(*) as Total from hotel group by year;

# 5 - most comman room booking
select count(room_type_reserved) AS Total ,room_type_reserved
from hotel group by room_type_reserved order by Total desc;

# 6 - How many reservations fall on a weekend
select count(no_of_weekend_nights) AS weekend_reservations 
from hotel where no_of_weekend_nights > 0;

# 7 - What is the highest and lowest lead time for reservations?
select max(lead_time) AS highest, min(lead_time) AS Lowest from hotel;

# 8 - What is the most common market segment type for reservations?
select count(market_segment_type),market_segment_type AS Market_segment 
from hotel group by market_segment_type 
order by Market_segment desc;

# 9 - How many reservations have a booking status of "Confirmed"?
select count(booking_status) AS Confirmed_booking 
from hotel where booking_status = 'Not_Canceled';

# 10 - What is the total number of adults and children across all reservations?
select sum(no_of_adults) AS Total_Adults, sum(no_of_children)
AS Total_Childrens from hotel;

# 11 - What is the average number of weekend nights for reservations involving children?
select avg(no_of_weekend_nights) from hotel
where no_of_weekend_nights > 0 and no_of_children > 0;

# 12 - How many reservations were made in each month of the year?
select monthname(str_to_date(arrival_date, "%d-%m-%y")) as Months,
count(*) as Total from hotel group by Months;

# 13 - What is the average number of nights (both weekend and weekday) spent by guests for each room type?
select room_type_reserved AS room_type,avg(no_of_weekend_nights + no_of_week_nights) 
AS week_day from hotel group by room_type;


# 14 - For reservations involving children, what is the most common room type, and what is the average price for that room type?
select room_type_reserved,count(no_of_children) AS most_common_room,avg_price_per_room
from hotel group by room_type_reserved 
order by most_common_room desc;

# 15 - Find the market segment type that generates the highest average price per room.
select market_segment_type,avg(avg_price_per_room) AS High_avg_price_per_room from hotel 
group by market_segment_type 
order by High_avg_price_per_room desc;