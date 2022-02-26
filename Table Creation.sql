-- A travel company TravelOnTheGo maintains the record of passengers and price to travel
-- between two cities, for bus type (Sitting and Sleeper).
create schema TravelOnGo ;
use TravelOnGo ;

-- Create Table for passenger 
Create table Passenger (
      Passenger_name varchar (50),
      Category varchar(10),
      Gender char,
      Boarding_City varchar(20),
	  Destination_City varchar(20),
      Distance int,
      Bus_Type varchar(20)
);

-- Create table for prices
Create table Price (
	  Bus_Type varchar(20),
	  Distance int,
	  Price int
      );