-- 3) How many females and how many male passengers travelled for a minimum distance of 600 KMs?
select Gender, count(*) from passenger 
       where Distance >= 600 
             group by passenger.Gender;

-- 4) Find the minimum ticket price for Sleeper Bus.
SELECT MIN(Price) FROM price WHERE Bus_TYPE = 'Sleeper';

-- 5) Select passenger names whose names start with character 'S'
select Passenger_name from passenger where Passenger_name like '%S' or Passenger_name like 'S%' ;

-- 6) Calculate price charged for each passenger displaying Passenger name, Boarding City,
-- Destination City, Bus_Type, Price in the output
SELECT Passenger_name,Boarding_City,Destination_City,Passenger.Bus_Type,Price FROM 
	passenger LEFT JOIN
		price ON (passenger.Bus_Type = price.Bus_Type
				 && passenger.Distance = Price.Distance)
GROUP BY Passenger_name,Boarding_City,Destination_City,passenger.Bus_Type,Price;

-- 7) What is the passenger name and his/her ticket price who travelled in Sitting bus for a
-- distance of 1000 KMs.				
    SELECT 
    p1.Passenger_name, p2.Price FROM PASSENGER p1, PRICE p2 
    WHERE p1.Distance = p2.Distance and p1.Distance=1000 and p2.Bus_type = "Sitting";

-- 8) What will be the Sitting and Sleeper bus charge for Pallavi to travel 
	-- from Bangalore to Panaji?

SELECT 
    passenger.Destination_City AS BoardingCity, 
	passenger.Boarding_City AS DestinationCity, 
    price.Bus_Type,Price
FROM 
	passenger LEFT JOIN
		price ON (PASSENGER.Distance = PRICE.Distance)
WHERE 
	passenger.Passenger_name = 'Pallavi';

-- 9) List the distances from the "Passenger" table which are unique 
	-- (non-repeated distances) in descending order.

SELECT Distance FROM passenger
GROUP BY Distance HAVING count(Distance) = 1
ORDER BY Distance DESC;

-- 10) Display the passenger name and percentage of distance travelled by that passenger 
	-- from the total distance travelled by all passengers without using user variables

SELECT Passenger_name,
    (Distance * 100)/SUM(Distance) OVER() AS TraveledDistancePercentage
FROM passenger GROUP BY Passenger_name;

	
-- 11) Display the distance, price in three categories in table Price
	-- a) Expensive if the cost is more than 1000
	-- b) Average Cost if the cost is less than 1000 and greater than 500
	-- c) Cheap otherwise

SELECT Distance,Price,
    CASE
		WHEN Price >= 1000 THEN 'Expensive'
        WHEN Price < 1000 AND Price >= 500 THEN 'Average Cost'
        WHEN Price < 500 THEN 'Cheap'
	END AS Category
 FROM
	Price;