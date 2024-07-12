USE campusx;

CREATE TABLE uber_ride(
	ride_id INTEGER PRIMARY KEY AUTO_INCREMENT,
    user_id INTEGER,
    cab_id INTEGER,
    start_time DATETIME,
    end_time DATETIME
);

SELECT * FROM campusx.uber_ride;

INSERT INTO campusx.uber_ride(user_id,cab_id,start_time,end_time) 
VALUES (22, 33, '2023-03-11 22:00:00', NOW());

-- CURRENT_DATE() ---> tells current date

SELECT CURRENT_DATE();

-- CURRENT_TIME() ---> tells current time

SELECT CURRENT_TIME();

-- NOW() ---> Tells current date-time()

SELECT NOW();

-- EXTRACTION FUNCTIONS

-- 1. DATE() and TIME()
-- 2. YEAR()
-- 3. LAST_DAY() --> gives the last day of the given month in YYYY-MM-DD format.  
 
SELECT *, 
DATE(start_time) AS sdate, 
TIME(start_time), 
YEAR(start_time), 
MONTHNAME(start_time), 
DAY(start_time), 
DAYOFWEEK(start_time), 
DAYNAME(start_time),
QUARTER(start_time),
HOUR(start_time),
MINUTE(start_time),
SECOND(start_time),
DAYOFYEAR(start_time),
LAST_DAY(start_time),
WEEK(start_time),
WEEKOFYEAR(start_time)
FROM campusx.uber_ride;  

--  DateTime Formatting

-- Q. Show the start_date of every uber_ride in DD-MM-YYYY format.
 
SELECT *, DATE_FORMAT(start_time,'%d %b, %y') FROM campusx.uber_ride;

-- Q. Show the start_time of every uber_ride in HH:MM (GMT) format

SELECT *, TIME_FORMAT(start_time, '%h : %i %p') FROM campusx.uber_ride;

SELECT *, DATE_FORMAT(start_time, '%l : %i %p') FROM campusx.uber_ride;

-- TYPE CONVERSION

-- Implicit Type Conversion ---> MySQL intelligently parses a date-time string of format YYYY-MM-DD.

-- Explicit Type Conversion ---> STR_TO_DATE() ---> Parses a date-time string to YYYY-MM-DD format. 
-- STR_TO_DATE(date, specify the characters) ---> iski madad se sirf SQL ko samjhana hai hai ki kon si chiz kya hain

-- Q. Convert 9-Mar Hello 23 to YYYY-MM-DD format.

SELECT STR_TO_DATE('9-Mar Hello 23','%e-%b Hello %y');

-- DATETIME Arithematic

-- DATEDIFF() ---> gives difference between two dates.

SELECT DATEDIFF(CURRENT_DATE(),'2024-05-25');

-- TIMEDIFF()

SELECT TIMEDIFF(CURRENT_TIME(),'7:00:00');

-- DATE_ADD() and DATE_SUB() INTERVAL ---> gives the datetime after a given interval

-- Q. What will be the datetime after 10 quarter from now onwards?

SELECT NOW(), DATE_ADD(NOW(),INTERVAL 10 QUARTER);

-- Q. What was the datetime 10 quarter ago from now onwards?

SELECT NOW(), DATE_SUB(NOW(),INTERVAL 10 QUARTER);

-- ADDTIME() and SUBTIME()

-- AUTO_UPDATE Feature of TimeStamp

CREATE TABLE post(
	post_id INTEGER PRIMARY KEY AUTO_INCREMENT,
	user_id INTEGER,
    content TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP
);


SELECT * FROM post;

INSERT INTO post(user_id, content) 
VALUES(1, 'Hello World');

UPDATE post
SET content = 'No More Hello World'
WHERE user_id = 1;
