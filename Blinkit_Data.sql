SELECT * FROM blinkit.blinkit_data;


-- Total Sales KPI
select round(sum(sales) / 1000000 ,2) AS total_sales_million
from blinkit_data;

-- Average Sales

select round(avg(sales),2) as Avg_Sales
from blinkit_data;

-- Number of Items
select count(*) as No_of_Items
from blinkit_data;

-- Average_Rating
select round(avg(rating),2) as Avg_Rating
from blinkit_data;

-- Total Sales by Content

select item_fat_content,
	round(sum(sales),2)  as Total_Sales
from blinkit_data
group by item_fat_content;

-- Total Sales by Item Type

select item_type,
	round(sum(sales),2) as Total_Sales
from blinkit_data
group by item_type
order by Total_Sales desc;

-- Total Sales by Outlet Establishment Year

select outlet_establishment_year,
	round(sum(sales),2) as Total_Sales
from blinkit_data
group by outlet_establishment_year
order by Total_Sales desc;

-- Sales by Outlet Size

select outlet_size,
	round(sum(sales),2) as Total_Sales
from blinkit_data
group by outlet_size
order by Total_Sales desc;

-- Sales Percentage by Outlet Size

select outlet_size,
	round(sum(sales),2) as Total_Sales,
    round(
		sum(sales) * 100 / sum(sum(sales)) over(),
        2
        ) as Sales_Percentage
from blinkit_data
group by outlet_size
order by Total_Sales desc;


-- Sales by Outlet Location

select outlet_location_type,
	round(sum(sales),2) as Total_Sales
from blinkit_data
group by outlet_location_type
order by Total_Sales desc;

-- Fat Content by Outlet Location

select outlet_location_type,
	round(sum(case
		when item_fat_content = 'Low Fat'
        then sales
        else 0
        end),2) as Low_Fat,
        
        round(sum(case
			when item_fat_content = 'Regular'
            then sales
            else 0
            end),2) as Regular
            
from blinkit_data
group by outlet_location_type
order by outlet_location_type;


-- All Metrics by Outlet Type
select outlet_type,
       round(sum(sales), 2) as Total_Sales,
       round(avg(sales), 2) as Avg_Sales,
       count(*) as No_of_Items,
       round(avg(rating), 2) as Avg_Rating,
       round(avg(item_visibility), 2) as avg_item_visibility
from blinkit_data
group by outlet_type
order by Total_Sales desc;