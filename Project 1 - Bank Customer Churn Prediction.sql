-- Select the top 10 rows from the customer churn csv
SELECT TOP 10 *
  FROM [customer_churn].[dbo].[Bank Customer Churn Prediction];

-- Select only the following attributes from this dataset
SELECT gender, age, tenure, churn FROM [customer_churn].[dbo].[Bank Customer Churn Prediction];

-- Arrange all the customers's age in ascending order
SELECT * FROM [customer_churn].[dbo].[Bank Customer Churn Prediction]
ORDER BY age;

-- Obtain the top 10 oldest customers
SELECT TOP 10 * FROM [customer_churn].[dbo].[Bank Customer Churn Prediction]
ORDER BY age DESC;

-- Obtain the top 10 oldest customers with the highest tenure
SELECT TOP 10 * FROM [customer_churn].[dbo].[Bank Customer Churn Prediction]
ORDER BY age DESC,
tenure ASC;

-- Sort the data by country in ascending order
SELECT * FROM [customer_churn].[dbo].[Bank Customer Churn Prediction]
ORDER BY country;

-- Sort the data by the ordinal positions of columns
SELECT * FROM [customer_churn].[dbo].[Bank Customer Churn Prediction]
ORDER BY 1,2;

-- Obtain the distinct countries, genders and ages for all the customers
SELECT DISTINCT country, gender, age FROM [customer_churn].[dbo].[Bank Customer Churn Prediction];

-- Obtain only the distinct countries for all the customers
SELECT DISTINCT country FROM [customer_churn].[dbo].[Bank Customer Churn Prediction];

-- Obtain all the distinct records from this dataset
SELECT DISTINCT * FROM [customer_churn].[dbo].[Bank Customer Churn Prediction];

-- Obtain all the customers who are from France
SELECT * FROM [customer_churn].[dbo].[Bank Customer Churn Prediction]
WHERE country = 'France';

-- Obtain only the male customers from France
SELECT * FROM [customer_churn].[dbo].[Bank Customer Churn Prediction]
WHERE country = 'France' AND gender = 'Male';

-- Convert the data type for estimated_salary to decimal
ALTER TABLE [customer_churn].[dbo].[Bank Customer Churn Prediction] 
ALTER COLUMN estimated_salary DECIMAL(10,2);

-- Convert the data type for balance to decimal
ALTER TABLE [customer_churn].[dbo].[Bank Customer Churn Prediction] 
ALTER COLUMN balance DECIMAL(10,2);

-- Convert the data type for tenure to numeric
ALTER TABLE [customer_churn].[dbo].[Bank Customer Churn Prediction] 
ALTER COLUMN tenure NUMERIC(10,2);

-- Convert the data type for 'credit_score' to numeric
ALTER TABLE [customer_churn].[dbo].[Bank Customer Churn Prediction] 
ALTER COLUMN credit_score NUMERIC(10,2);


-- Obtain the top 10 male french customers with the highest salary
SELECT TOP 10 * FROM [customer_churn].[dbo].[Bank Customer Churn Prediction]
WHERE country = 'France' AND gender = 'Male'
ORDER BY estimated_salary DESC;

-- Obtain the top 10 female french customers with the highest salary
SELECT TOP 10 * FROM [customer_churn].[dbo].[Bank Customer Churn Prediction]
WHERE country = 'France' AND gender = 'Female'
ORDER BY estimated_salary DESC;

-- Obtain the top 10 male german customers with the highest tenure
SELECT TOP 10 * FROM [customer_churn].[dbo].[Bank Customer Churn Prediction]
WHERE country = 'Germany' AND gender = 'Male'
ORDER BY tenure DESC;

-- Obtain the top 10 male french customers with the highest salary and highest tenure
SELECT TOP 10 * FROM [customer_churn].[dbo].[Bank Customer Churn Prediction]
WHERE country = 'France' AND gender = 'Male'
ORDER BY estimated_salary DESC,
tenure DESC;

-- Obtain the top 10 female spanish customers who are the oldest
SELECT TOP 10 * FROM [customer_churn].[dbo].[Bank Customer Churn Prediction]
WHERE country = 'Spain' AND gender = 'Female'
ORDER BY age DESC;

-- Obtain the top 10 customers with the highest credit scores
SELECT TOP 10 * FROM [customer_churn].[dbo].[Bank Customer Churn Prediction]
ORDER BY age DESC;

-- Obtain the top 10 male customers with the highest credit scores
SELECT TOP 10 * FROM [customer_churn].[dbo].[Bank Customer Churn Prediction]
WHERE gender = 'Male'
ORDER BY age DESC;

-- Obtain the top 10 female german customers with the highest balance
SELECT TOP 10 * FROM [customer_churn].[dbo].[Bank Customer Churn Prediction]
WHERE gender = 'Female' AND country = 'Germany'
ORDER BY balance DESC;

-- Obtain the age, gender and tenure of the employees but arrange the tenure only in descending order
SELECT customer_id, country, age, tenure
FROM [customer_churn].[dbo].[Bank Customer Churn Prediction]
WHERE age IS NOT NULL
ORDER BY tenure DESC;

-- Obtain the number of active products for all the customers except for the ones residing in Spain
SELECT customer_id, country, products_number
FROM [customer_churn].[dbo].[Bank Customer Churn Prediction]
WHERE country NOT IN ('Spain')
ORDER BY products_number DESC;

-- Obtain the top 10 customers with the highest salaries but are residing only in France
SELECT customer_id, estimated_salary
FROM [customer_churn].[dbo].[Bank Customer Churn Prediction]
WHERE country NOT IN ('Spain', 'Germany')
ORDER BY estimated_salary DESC;

-- Obtain the customers with salaries between 150000 and 200000 and are not residing in Germany nor France and have ages between 50 & 70 years
SELECT customer_id, country, age, estimated_salary
FROM [customer_churn].[dbo].[Bank Customer Churn Prediction]
WHERE country NOT IN ('Germany', 'France') 
AND estimated_salary BETWEEN 150000 AND 200000
AND age BETWEEN 50 AND 70
ORDER BY estimated_salary DESC;

-- Perform an inner join of both the tables "customer_churn1" & "customer_churn2" and arrange the column "estimated_salary" in descending order
SELECT country, tenure, products_number, credit_card, estimated_salary, churn FROM customer_churn..customer_churn1 cus_1
INNER JOIN customer_churn..customer_churn2 cus_2
	ON cus_1.customer_id = cus_2.customer_id
ORDER BY estimated_salary DESC;

-- Obtain the number of customers for each country
SELECT country, COUNT(country) AS Num_of_Customers
FROM [customer_churn].[dbo].[Bank Customer Churn Prediction]
GROUP BY country
ORDER BY Num_of_Customers DESC;

-- Obtain the total number of male and female customers in each country
SELECT country, gender, COUNT(country) AS Num_of_Customers
FROM [customer_churn].[dbo].[Bank Customer Churn Prediction]
GROUP BY country, gender
ORDER BY country DESC;

-- Replace the records under the attribute "churn" [1 as Churned, 0 as Not Churned]
UPDATE [customer_churn].[dbo].[Bank Customer Churn Prediction]
SET churn = 
    CASE 
        WHEN churn = 1 THEN 'Churned'
        WHEN churn = 0 THEN 'Not Churned'
        ELSE churn
    END;


-- Obtain the number of people in each country who churned or not
SELECT country, churn, COUNT(country) AS Churn_Statistics
FROM [customer_churn].[dbo].[Bank Customer Churn Prediction]
GROUP BY country, churn
ORDER BY country DESC;

-- Obtain the churn statistics for each gender
SELECT gender, churn, COUNT(country) AS Churn_Statistics
FROM [customer_churn].[dbo].[Bank Customer Churn Prediction]
GROUP BY gender, churn
ORDER BY Churn_Statistics DESC;

-- Obtain the churn statistics by gender for each location
SELECT gender, country, churn, COUNT(country) AS Churn_Statistics
FROM [customer_churn].[dbo].[Bank Customer Churn Prediction]
GROUP BY gender,country, churn
ORDER BY gender DESC;

-- Obtain the average estimated salary for all the customers who have churned and not churned as well and format the estimated salary in terms of USD
SELECT churn, FORMAT(CAST(ROUND(AVG(estimated_salary), 1) AS money), 'C', 'en-us') AS Avg_Salary 
FROM [customer_churn].[dbo].[Bank Customer Churn Prediction]
GROUP BY churn
ORDER BY Avg_Salary DESC;

-- Obtain the average estimated salary for all the customers who have churned and group by the gender as well
SELECT gender, churn, FORMAT(CAST(ROUND(AVG(estimated_salary), 1) AS money), 'C', 'en-us') AS Avg_Salary 
FROM [customer_churn].[dbo].[Bank Customer Churn Prediction]
GROUP BY gender, churn
ORDER BY Avg_Salary DESC;

-- Obtain the average estimated salary for all the male & female customers who have churned & not churned and group by their location as well
SELECT gender, country, churn, FORMAT(CAST(ROUND(AVG(estimated_salary), 1) AS money), 'C', 'en-us') AS Avg_Salary 
FROM [customer_churn].[dbo].[Bank Customer Churn Prediction]
GROUP BY gender, country, churn
ORDER BY gender DESC;

-- Obtain the highest salary for the scenario above
SELECT gender, country, churn, FORMAT(CAST(ROUND(MAX(estimated_salary), 1) AS money), 'C', 'en-us') AS Highest_Salary 
FROM [customer_churn].[dbo].[Bank Customer Churn Prediction]
GROUP BY gender, country, churn
ORDER BY gender DESC;

-- Obtain the lowest salary grouped by the gender, location and churn
SELECT gender, country, churn, FORMAT(CAST(ROUND(MIN(estimated_salary), 1) AS money), 'C', 'en-us') AS Lowest_Salary 
FROM [customer_churn].[dbo].[Bank Customer Churn Prediction]
GROUP BY gender, country, churn
ORDER BY gender DESC;

-- Obtain the total salary grouped by the gender, location and churn
SELECT gender, country, churn, FORMAT(CAST(ROUND(SUM(estimated_salary), 1) AS money), 'C', 'en-us') AS Total_Salary 
FROM [customer_churn].[dbo].[Bank Customer Churn Prediction]
GROUP BY gender, country, churn
ORDER BY gender DESC;

-- Obtain the number of males & females grouped by the location who have not churned more than 500
SELECT
    gender,
    country, churn,
    COUNT (churn) churn_stats
FROM
    [customer_churn].[dbo].[Bank Customer Churn Prediction]
GROUP BY
    gender,
    country, churn
HAVING
    COUNT (churn) >= 500
ORDER BY
    churn_stats;

-- Obtain the average salaries of male and female customers whose salries are above 50000 and group this by theie location and churn
SELECT
    gender,
    country, churn,
    AVG(estimated_salary) Avg_Salary
FROM
    [customer_churn].[dbo].[Bank Customer Churn Prediction]
GROUP BY
    gender,
    country, churn
HAVING
    AVG(estimated_salary) >= 50000
ORDER BY
    Avg_Salary DESC;

-- Obtain the total credit scores grouped by the gender and the location
SELECT
    gender,
    country,
    SUM (credit_score) Total_Credit_Score
FROM
    [customer_churn].[dbo].[Bank Customer Churn Prediction]
GROUP BY
    ROLLUP(gender, country);

-- Obtain the total credit scores grouped by the gender, country and churn
SELECT
    gender,
    country, churn,
    SUM (credit_score) Total_Credit_Score
FROM
    [customer_churn].[dbo].[Bank Customer Churn Prediction]
GROUP BY
    ROLLUP(gender, country, churn);

-- Obtain the total credit scores grouped by the churn
SELECT
    churn,
    SUM (credit_score) Total_Credit_Score
FROM
    [customer_churn].[dbo].[Bank Customer Churn Prediction]
WHERE churn IS NOT NULL
GROUP BY
    ROLLUP(churn);

-- Obtain the average balance grouped by the churn
SELECT
    churn,
    AVG (balance) Avg_Balance
FROM
    [customer_churn].[dbo].[Bank Customer Churn Prediction]
GROUP BY
    ROLLUP(churn);

-- Obtain the average tenure grouped by the churn
SELECT
    churn,
    AVG (tenure) Avg_Tenure
FROM
    [customer_churn].[dbo].[Bank Customer Churn Prediction]
GROUP BY
    ROLLUP(churn);

-- Obtain the average estimated salaries grouped by the country and churn
SELECT
    country, churn, estimated_salary
FROM
    [customer_churn].[dbo].[Bank Customer Churn Prediction]
WHERE
    estimated_salary > (
        SELECT
            AVG (estimated_salary)
        FROM
            [customer_churn].[dbo].[Bank Customer Churn Prediction]
        WHERE
            country IN (
                SELECT
                    country
                FROM
                    [customer_churn].[dbo].[Bank Customer Churn Prediction]
                WHERE
                    country = 'France'
                OR country = 'Germany'
            )
    )
ORDER BY
    estimated_salary DESC;


-- 




