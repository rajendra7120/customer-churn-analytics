SELECT COUNT(*) AS Total_Customers
FROM customer_churn;

SELECT
    COUNT(*) AS Total_Customers,
    ROUND(AVG(MonthlyCharges),2) AS Avg_Monthly_Charge,
    ROUND(AVG(TotalCharges),2) AS Avg_Total_Charge
FROM customer_churn;

SELECT
    ROUND(SUM(MonthlyCharges),2) AS Monthly_Revenue_Lost
FROM customer_churn
WHERE Churn='Yes';

SELECT
    Contract,
    COUNT(*) AS Customers,
    ROUND(AVG(MonthlyCharges),2) AS Avg_Monthly_Charge,
    ROUND(AVG(TotalCharges),2) AS Avg_Total_Charge
FROM customer_churn
GROUP BY Contract
ORDER BY Customers DESC;

SELECT
    Contract,
    COUNT(*) AS Customers,
    SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS Churned,
    ROUND(
        SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) *100.0/
        COUNT(*),2
    ) AS Churn_Rate
FROM customer_churn
GROUP BY Contract
ORDER BY Churn_Rate DESC;

SELECT
    PaymentMethod,
    COUNT(*) AS Customers,
    ROUND(AVG(MonthlyCharges),2) AS Avg_Monthly_Charge,
    ROUND(AVG(TotalCharges),2) AS Avg_Total_Charge
FROM customer_churn
GROUP BY PaymentMethod
ORDER BY Customers DESC;

SELECT
    InternetService,
    COUNT(*) AS Customers,
    ROUND(AVG(MonthlyCharges),2) AS Avg_Monthly_Charge,
    ROUND(AVG(TotalCharges),2) AS Avg_Total_Charge
FROM customer_churn
GROUP BY InternetService;

SELECT
    ROUND(AVG(tenure),2) AS Avg_Tenure,
    MAX(tenure) AS Max_Tenure,
    MIN(tenure) AS Min_Tenure
FROM customer_churn;


SELECT
    customerID,
    Contract,
    MonthlyCharges,
    TotalCharges
FROM customer_churn
ORDER BY TotalCharges DESC
LIMIT 10;
