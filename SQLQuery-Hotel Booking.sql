SELECT *
from dbo.[2018]
SELECT *
from dbo.[2019]

SELECT *
from dbo.[2020]

---Let's bring all the data in one Teble..One unified dataset by using UNION command

SELECT *
from dbo.[2018]
union
SELECT *
from dbo.[2019]
union
SELECT *
from dbo.[2020]

-------Let's check if Hotal reveneu is growing

With hotels as (

SELECT * from dbo.[2018]
union
SELECT * from dbo.[2019]
union
SELECT * from dbo.[2020] )

SELECT * from hotels

With hotels as (
SELECT * from dbo.[2018]
union
SELECT * from dbo.[2019]
union
SELECT * from dbo.[2020] )
SELECT (stays_in_week_nights + stays_in_weekend_nights)*adr as reveneu from hotels

------Now we would like to see if it is creasing by year...

With hotels as (
SELECT * from dbo.[2018]
union
SELECT * from dbo.[2019]
union
SELECT * from dbo.[2020] )

SELECT 
arrival_date_year,
SUM((stays_in_week_nights + stays_in_weekend_nights)*adr) as reveneu
from hotels
group by arrival_date_year

------------Now let's check by Hotel type..

With hotels as (
SELECT * from dbo.[2018]
union
SELECT * from dbo.[2019]
union
SELECT * from dbo.[2020] )

SELECT 
arrival_date_year,hotel,
round(SUM((stays_in_week_nights + stays_in_weekend_nights)*adr),2) as reveneu
from hotels
group by arrival_date_year,hotel

--------We see that reveneu is growing year by for each hotel.....

----Now let's bring other two table which consists of market_segment and meal_cost....

SELECT *
FROM dbo.market_segment

-----Let's join with 2018,2019, and 2020 table

With hotels as (
SELECT * from dbo.[2018]
union
SELECT * from dbo.[2019]
union
SELECT * from dbo.[2020] )

SELECT * from hotels
Left JOIN dbo.market_segment
on hotels.market_segment = market_segment.market_segment
LEFT JOIN dbo.meal_cost
on meal_cost.meal = hotels.meal
