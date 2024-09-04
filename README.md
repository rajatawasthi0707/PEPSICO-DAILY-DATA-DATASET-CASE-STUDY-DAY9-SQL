# PEPSICO-DAILY-DATA-DATASET-CASE-STUDY-DAY9-SQL
PEPSICO-DAILY-DATA-DATASET-CASE-STUDY-DAY9-SQL
# PepsiCo Stock Data SQL Queries

## Project Overview
This project contains a collection of SQL queries designed to analyze historical stock data for PepsiCo. The dataset includes daily records of stock prices and trading volume. The queries range from simple data retrieval to advanced calculations, allowing for a comprehensive analysis of the dataset.

## Prerequisites
- A relational database management system (e.g., MySQL, PostgreSQL).
- A table named `pep` with the following columns:
  - `Date` (DATE)
  - `Open` (FLOAT)
  - `High` (FLOAT)
  - `Low` (FLOAT)
  - `Close` (FLOAT)
  - `Volume` (INT)

## SQL Script

```sql
-- Retrieve all data for the date '1972-06-01'.

-- What was the opening price on the first day in the dataset?

-- What was the highest price recorded in the entire dataset?

-- Find the date with the lowest closing price.

-- What is the total volume traded across all dates?

-- How many trading days are recorded in the dataset?

-- List the data for the top 5 days with the highest trading volume.

-- What is the average closing price across the dataset?

-- What is the highest trading volume recorded in a single day?

-- Retrieve the highest, lowest, and average opening prices.

-- Retrieve all days where the closing price was greater than the opening price.

-- Find all records where the trading volume was above 1 million.

-- List all records where the high price was more than twice the low price.

-- What was the closing price on the date where the opening price was the highest?

-- Retrieve all data for the year 1980.

-- Calculate the total trading volume for each year.

-- Find the average closing price for each month across all years.

-- What is the average trading volume per year?

-- Find the year with the highest average closing price.

-- Calculate the average difference between the opening and closing prices.

-- What was the closing price on the last day of the dataset?

-- What was the highest opening price in the month of June across all years?

-- Calculate the total trading volume for each month in the dataset.

-- What was the highest trading volume in the year 1995?

-- List all records where the date is a Monday and the closing price was above $100.

-- Calculate the moving average of the closing price over a 7-day period.

-- Find the days where the price dropped by more than 5% compared to the previous day.

-- Identify the days where the trading volume was significantly higher (e.g., more than 50%) than the previous day.

-- Which month saw the highest average price increase from open to close?

-- Find the longest streak of days where the closing price was continuously increasing.
