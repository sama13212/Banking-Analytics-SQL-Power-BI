CREATE DATABASE BankingAnalytics;
GO

USE BankingAnalytics;
GO

SELECT *
FROM customers;

select count(distinct CustomerID) as total_customers 
from customers

select count(distinct CustomerID)as total_customer_per_type,TypeName
from customers c
join customer_types ct on c.CustomerTypeID=ct.CustomerTypeID 
group by ct.TypeName
order by count(distinct CustomerID) asc;

select top 10 count (distinct CustomerID) as total_cus,d.City
from customers c
join addresses d on c.AddressID=d.AddressID
group by d.City
order by count (distinct CustomerID) desc 



-----------------------------------------------------------

select count (distinct AccountID)as nom_of_accs,a_t.TypeName
from accounts a
join account_types a_t on a_t.AccountTypeID=a.AccountTypeID
group by a_t.TypeName
order by count (distinct AccountID) desc;



select count (distinct AccountID)as nom_of_accs,a_s.StatusName
from accounts a
join account_statuses a_s on a_s.AccountStatusID=a.AccountStatusID
group by a_s.StatusName
order by count (distinct AccountID) desc;

------------------------------------------------

select sum(Amount)as total_amount_from_all_trasactions
from transactions

select top 10 avg(Amount)as total_amount_from_all_trasactions,BranchName
from transactions t
join branches b on b.BranchID =t.BranchID
group by b.BranchName
order by avg(Amount)desc ;

select count (distinct TransactionID),tt.TypeName
from transactions t
join transaction_types tt on t.TransactionTypeID=tt.TransactionTypeID
group by tt.TypeName
order by count (distinct TransactionID) desc ;

----------------------------------------
select avg (PrincipalAmount) as avg_Principal_Amount
from loans
-------------------------------------
SELECT 
    at.TypeName,
    COUNT(DISTINCT a.AccountID) AS NumberOfAccounts,
    SUM(a.Balance) AS TotalBalance
FROM accounts a
JOIN account_types at
    ON a.AccountTypeID = at.AccountTypeID
GROUP BY at.TypeName
ORDER BY TotalBalance DESC;

SELECT
    COUNT(*) AS CustomersWithMultipleAccounts,
    (SELECT COUNT(*) FROM customers) AS TotalCustomers,
    COUNT(*) * 100.0 / (SELECT COUNT(*) FROM customers) AS PercentageOfCustomers
FROM (
    SELECT 
        c.CustomerID
    FROM customers c
    JOIN accounts a
        ON c.CustomerID = a.CustomerID
    GROUP BY c.CustomerID
    HAVING COUNT(DISTINCT a.AccountID) > 1
) AS MultiAccountCustomers;


SELECT
    ls.StatusName,
    COUNT(DISTINCT l.LoanID) AS NumberOfLoans,
    SUM(l.PrincipalAmount) AS TotalPrincipal
FROM loans l
JOIN loan_statuses ls
    ON l.LoanStatusID = ls.LoanStatusID
GROUP BY ls.StatusName
ORDER BY NumberOfLoans DESC;


------------------------------------------
SELECT
    YEAR(TransactionDate) AS TransactionYear,
    MONTH(TransactionDate) AS TransactionMonth,
    COUNT(DISTINCT TransactionID) AS NumberOfTransactions,
    SUM(Amount) AS TotalAmount
FROM transactions
GROUP BY
    YEAR(TransactionDate),
    MONTH(TransactionDate)
ORDER BY
    TransactionYear,
    TransactionMonth;


--------------------------------------------------------------
SELECT 
    tt.TypeName,
    COUNT(DISTINCT t.TransactionID) AS NumberOfTransactions,
    SUM(t.Amount) AS TotalAmount,
    AVG(t.Amount) AS AvgAmount
FROM transactions t
JOIN transaction_types tt
    ON t.TransactionTypeID = tt.TransactionTypeID
GROUP BY tt.TypeName
ORDER BY TotalAmount DESC;
------------------------------------------------------------------

--------Customers with highest balances--------------------------------
SELECT TOP 3
    c.CustomerID,
    c.FirstName,
    SUM(ac.Balance) AS total_balance
FROM accounts ac
JOIN customers c
    ON c.CustomerID = ac.CustomerID
GROUP BY c.CustomerID, c.FirstName
ORDER BY total_balance DESC;


--------------------------------------------------
WITH MonthlyTransactions AS (
    SELECT
        YEAR(TransactionDate) AS TransactionYear,
        MONTH(TransactionDate) AS TransactionMonth,
        SUM(Amount) AS TotalAmount
    FROM transactions
    GROUP BY
        YEAR(TransactionDate),
        MONTH(TransactionDate)
)

SELECT
    TransactionYear,
    TransactionMonth,
    TotalAmount,

    LAG(TotalAmount) OVER (
        ORDER BY TransactionYear, TransactionMonth
    ) AS PreviousMonthAmount,

    (TotalAmount - LAG(TotalAmount) OVER (
        ORDER BY TransactionYear, TransactionMonth
    )) * 100.0
    / NULLIF(
        LAG(TotalAmount) OVER (
            ORDER BY TransactionYear, TransactionMonth
        ), 0
    ) AS MoMGrowthPercentage

FROM MonthlyTransactions

ORDER BY
    TransactionYear,
    TransactionMonth;

