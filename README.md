# Banking Analytics — SQL & Power BI

## Overview

An end-to-end banking analytics project built to analyze customer profiles, accounts, transactions, loans, and branch performance using **SQL Server** and **Power BI**.

The project focuses on transforming relational banking data into meaningful business insights through SQL analysis and interactive data visualization.

## Project Objectives

The analysis answers key business questions related to:

* Customer segmentation and geographic distribution
* Account types and account statuses
* Transaction activity and transaction types
* Branch performance
* Customer account ownership
* Loan portfolio status
* Customer balances
* Monthly transaction trends and MoM growth

## Database Structure

The database, **BankingAnalytics**, contains multiple related tables covering the main banking entities:

* Customers
* Customer Types
* Addresses
* Accounts
* Account Types
* Account Statuses
* Transactions
* Transaction Types
* Branches
* Loans
* Loan Statuses

A database relationship diagram was created to visualize the relationships between the tables and understand the underlying data model.

## Key Metrics

| Metric                           |   Value |
| -------------------------------- | ------: |
| Total Customers                  |   1,100 |
| Total Accounts                   |   1,651 |
| Active Accounts                  |   1,327 |
| Inactive Accounts                |     250 |
| Closed Accounts                  |      74 |
| Total Transaction Amount         | 125.19M |
| Average Loan Principal           |  51.78K |
| Customers with Multiple Accounts |     485 |

## Customer Analysis

Customers were analyzed by customer type and geographic location.

### Customer Types

* Individual: 351
* Small Business: 352
* Large Enterprise: 397

The analysis also examined customer distribution by city and country. The United States represented the largest customer country in the dataset, with 1,063 customers.

## Account Analysis

The project analyzed account distribution across different account types and statuses.

### Account Types

| Account Type | Accounts | Total Balance |
| ------------ | -------: | ------------: |
| Business     |      360 |        17.66M |
| Savings      |      333 |        16.82M |
| Youth        |      336 |        16.33M |
| Payroll      |      311 |        15.71M |
| Checking     |      311 |        15.28M |

Business accounts held the highest total balance among the account types analyzed.

### Account Status

* Active: 1,327
* Inactive: 250
* Closed: 74

## Transaction Analysis

The project analyzed transaction volume, total transaction amount, and average transaction amount by transaction type.

| Transaction Type | Transactions | Total Amount | Avg. Amount |
| ---------------- | -----------: | -----------: | ----------: |
| Deposit          |       15,065 |       37.98M |    2,495.81 |
| Transfer         |       14,771 |       37.53M |    2,518.40 |
| Withdrawal       |       14,706 |       37.15M |    2,499.06 |
| Payment          |        4,958 |       12.53M |    2,499.62 |

Deposit transactions had the highest transaction count and total transaction amount.

## Branch Analysis

Branch performance was analyzed using the average transaction amount.

The top branches by average transaction amount included:

* Branch 39 — 2,602.16
* Branch 13 — 2,595.06
* Branch 24 — 2,578.07
* Branch 42 — 2,572.65
* Branch 47 — 2,569.24

## Customer Account Ownership

The analysis identified **485 customers with more than one account**, representing approximately **44% of the customer base**.

This analysis was performed using `GROUP BY` and `HAVING COUNT(DISTINCT AccountID) > 1`.

## Loan Analysis

The loan portfolio was analyzed by loan status, including:

* Active
* Paid Off
* Overdue

The analysis compared both the number of loans and their total principal amounts across statuses.

The average loan principal amount was approximately **51.78K**.

## Customer Balance Analysis

The project also identified customers with the highest combined account balances.

Top customers by total balance included:

| Customer  | Total Balance |
| --------- | ------------: |
| Nathanael |       536.40K |
| Edison    |       509.86K |
| Belkis    |       504.12K |

## Time-Based Transaction Analysis

Transaction activity was analyzed by year and month to identify changes in transaction volume and total transaction amount over time.

A **Month-over-Month (MoM) Growth** analysis was also implemented using the SQL `LAG()` window function.

The calculation compares each month's total transaction amount with the previous month's value:

```sql
(TotalAmount - PreviousMonthAmount)
/
PreviousMonthAmount * 100
```

This allows monthly changes in transaction value to be tracked over time.

## SQL Techniques Used

The project demonstrates practical SQL techniques including:

* `SELECT`
* `WHERE`
* `JOIN`
* `GROUP BY`
* `HAVING`
* `ORDER BY`
* `TOP`
* Aggregate functions

  * `COUNT`
  * `SUM`
  * `AVG`
* `DISTINCT`
* Subqueries
* Common Table Expressions (`CTE`)
* Window Functions
* `LAG()`
* Date functions

  * `YEAR()`
  * `MONTH()`
* Conditional calculations
* Percentage calculations
* MoM growth analysis

## Tools & Technologies

* **SQL Server**
* **T-SQL**
* **Power BI**
* **SQL Server Management Studio (SSMS)**
* **Data Modeling / ERD**

## Project Workflow

```text
Banking Database
       ↓
Relational Data Model
       ↓
SQL Analysis
       ↓
Business Questions & KPIs
       ↓
Power BI
       ↓
Interactive Banking Dashboard
```

## Key Takeaways

This project demonstrates the ability to:

* Work with a relational banking database
* Understand table relationships and data models
* Write SQL queries to answer business questions
* Perform customer, account, transaction, branch, and loan analysis
* Use window functions for time-based analysis
* Calculate MoM growth using SQL
* Translate raw database data into business-focused insights
* Prepare analytical results for Power BI visualization

## Project Files

* `BankingAnalytics.sql` — Database creation and analysis queries
* `BankingAnalytics` — SQL Server database
* `Database Diagram` — Entity relationship diagram
* `Power BI Dashboard` — Interactive banking analytics dashboard
