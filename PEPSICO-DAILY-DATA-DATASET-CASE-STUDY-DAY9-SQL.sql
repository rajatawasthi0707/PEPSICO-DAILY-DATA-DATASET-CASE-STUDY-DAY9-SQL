-- USE PEPSICO

-- Retrieve all data for the date '1972-06-01'.

SELECT * FROM pep
WHERE Date = '1972-06-01';

-- What was the opening price on the first day in the dataset?

SELECT Open FROM pep
LIMIT 1;

-- What was the highest price recorded in the entire dataset?

SELECT MAX(High) FROM pep ;

-- Find the date with the lowest closing price.

SELECT Date FROM pep
WHERE Close = (SELECT MIN(Close) FROM pep);

-- What is the total volume traded across all dates?

SELECT SUM(Volume) FROM pep;

-- How many trading days are recorded in the dataset?

SELECT COUNT(DISTINCT(Date)) FROM pep;

-- List the data for the top 5 days with the highest trading volume.

SELECT * FROM pep
ORDER BY Volume DESC
LIMIT 5;

-- What is the average closing price across the dataset?

SELECT AVG(Close) FROM pep;

-- What is the highest trading volume recorded in a single day?

SELECT * FROM pep
WHERE Volume = (SELECT MAX(Volume) FROM pep);

-- Retrieve the highest, lowest, and average opening prices.

SELECT MAX(Open),MIN(Open),AVG(Open) FROM pep;

-- Retrieve all days where the closing price was greater than the opening price

SELECT * FROM pep
WHERE Close >Open;

-- Find all records where the trading volume was above 1 million.

SELECT * FROM pep
WHERE Volume > 100000;

-- List all records where the high price was more than twice the low price.

SELECT * FROM pep
WHERE High > 2*(Low);

-- What was the closing price on the date where the opening price was the highest?

SELECT Date FROM pep
WHERE Open = (SELECT MAX(Open) FROM pep);

-- Retrieve all data for the year 1980.

SELECT * FROM pep
WHERE Year(DATE) = '1980';

-- Calculate the total trading volume for each year.

SELECT YEAR(Date),SUM(Volume) FROM pep
GROUP BY YEAR(Date);

-- Find the average closing price for each month across all years.

SELECT MONTH(Date),YEAR(Date),AVG(Close) FROM pep
GROUP BY MONTH(Date),YEAR(Date);

-- What is the average trading volume per year?

SELECT YEAR(Date),AVG(Volume) FROM pep
GROUP BY YEAR(Date);

-- Find the year with the highest average closing price.

SELECT YEAR(Date) FROM pep
WHERE Close = (SELECT MAX(Close) FROM pep);

-- Calculate the average difference between the opening and closing prices.

SELECT AVG(Open - Close) FROM pep;

-- What was the closing price on the last day of the dataset?

SELECT Close FROM pep
ORDER BY Date DESC
LIMIT 1;

-- What was the highest opening price in the month of June across all years?

SELECT YEAR(Date),MAX(High) FROM pep
WHERE MONTH(Date) = '06'
GROUP BY YEAR(Date);

-- Calculate the total trading volume for each month in the dataset.

SELECT MONTHNAME(Date),SUM(Volume) FROM pep
GROUP BY MONTHNAME(Date);

-- What was the highest trading volume in the year 1995?

SELECT MAX(Volume) FROM pep
WHERE YEAR(Date) = '1995';

-- List all records where the date is a Monday and the closing price was above $100.

SELECT * FROM pep
WHERE WEEKDAY(DATE) = '02' AND Close > 100;

-- Calculate the moving average of the closing price over a 7-day period.

SELECT Date,Close,AVG(Close) OVER(ORDER BY Date ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS moving_avg FROM pep;

-- Find the days where the price dropped by more than 5% compared to the previous day.

SELECT Date, Close 
FROM (SELECT Date, Close, 
             LAG(Close, 1) OVER (ORDER BY Date) AS Previous_Close 
      FROM stock_data) AS Temp 
WHERE (Previous_Close - Close) / Previous_Close > 0.05;

-- Identify the days where the trading volume was significantly higher (e.g., more than 50%) than the previous day.

SELECT Date, Volume 
FROM (SELECT Date, Volume, 
             LAG(Volume, 1) OVER (ORDER BY Date) AS Previous_Volume 
      FROM stock_data) AS Temp 
WHERE Volume > 1.5 * Previous_Volume;

-- Which month saw the highest average price increase from open to close?

SELECT YEAR(Date) AS Year, MONTH(Date) AS Month, AVG(Close - Open) AS Average_Increase 
FROM pep 
GROUP BY Year, Month 
ORDER BY Average_Increase DESC 
LIMIT 1;

