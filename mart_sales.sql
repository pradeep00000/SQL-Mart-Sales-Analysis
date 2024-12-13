create schema mart;
select * from mart.amazingmarteu2geo;

#1. Count Total Orders
select count(*) from mart.amazingmarteu2geo;

#2. List Unique Countries
select distinct(Country) 
from mart.amazingmarteu2geo;

#3. Find Orders from a Specific City
select * from mart.amazingmarteu2geo
where City = 'Stockholm';

#4. Find Customers with Orders in Multiple Regions
select `Customer Name`
from mart.amazingmarteu2geo
group by `Customer Name`
having count(distinct Region) > 1;

#5. List Ship Modes
select distinct(`Ship Mode`) 
from mart.amazingmarteu2geo;

#6. Top 5 Most Frequent Customers
select `Customer Name` , count(`Customer Name`) as Order_Count
from mart.amazingmarteu2geo
group by `Customer Name` 
order by Order_Count desc
limit 5;

#7. Orders by Region
select Region , Count(Region) as count
from mart.amazingmarteu2geo
group by Region;

#8. Filter Orders Shipped with Economy Mode
select * from mart.amazingmarteu2geo
where `Ship Mode` = 'Economy';

#9. Orders Per Country
select Country , Count(Country) as Orders
from mart.amazingmarteu2geo
group by Country;

#10. Top 3 Countries by Orders
select Country , Count(Country) as Orders
from mart.amazingmarteu2geo
group by Country 
order by Orders desc
limit 3;

#11. Orders by Segment and Region
select Segment , Region , count(*) as Total_Count
from mart.amazingmarteu2geo
group by Segment,Region;

#12. Customer Order Patterns (Month-wise)
select `Customer Name`, month(`Order Date`) 
as order_month, count(*) as order_count
from mart.amazingmarteu2geo
group by `Customer Name`, month(`Order Date`);

#13. Find Top Cities with Orders
select City , count(City) as Orders
from mart.amazingmarteu2geo
group by City 
order by Orders desc
limit 10;

#14. Average Orders Per Segment and Region
select Segment, Region, avg(order_count) as avg_orders
from (
    select Segment, Region, count(*) AS order_count
    from mart.amazingmarteu2geo
    group by Segment, Region
) as subquery
group by Segment, Region;

#15. Geographical Analysis of Orders
select Country, avg(lat) as avg_lat, avg(lon) as avg_lon,
 count(*) as total_orders
from mart.amazingmarteu2geo
group by Country;