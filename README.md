# Service call Analysis

## Project Overview

**Project Title:** Service call Analysis  
**Level:** Beginner  
**Database:** swati

This project is designed to demonstrate SQL skills and techniques typically used by data analysts to explore, clean, and analyze sevicr call data. The project involves setting up a service call database, performing exploratory data analysis (EDA), and answering specific business questions through SQL queries. It is ideal for those who are starting their journey in data analysis and want to build a solid foundation in SQL.

---

## Objectives

1. **Set up a service call  database:** Create and populate a service call database with the provided service call data.  
2. **Data Cleaning:** Identify and remove any records with missing or null values.  
3. **Exploratory Data Analysis (EDA):** Perform basic exploratory data analysis to understand the dataset.  
4. **Business Analysis:** Use SQL to answer specific business questions and derive insights from the calls data.

---

## Project Structure

### 1. Database Setup

- **Database Creation:** The project starts by creating a database named swati.
- **Table Creation:** A table named `service call` is created to store the service call data.  
  The table includes the following fields:
  `sr no` 
   Branch 
	`Product Group` 
	`Complaint Date` 
	`Customer Type` 
   month 
   year 
   `Problem(Issue stated by customer)` 
	 `Primary Defect` 
	 `Gurantee Status` 
	 `Complaint Category`
    Status 


### 2. Data Insertion

Insert  real data using SQL `INSERT INTO` statements or import from a CSV file .

### 3. SQL Queries
# create table
```sql
create table `service call`(`sr no` int,
    Branch varchar(50),
	`Product Group`  varchar(50), 
	`Complaint Date` varchar(50),
	`Customer Type` varchar(50),
	month int,
	year int,
    `Problem(Issue stated by customer)` varchar(50),
	`Primary Defect` varchar(50),
	`Gurantee Status` varchar(50),
	`Complaint Category`	varchar(50),
    Status varchar(50)
)
```
# Exploratory Data Analysis
```sql
select * from `service call`
 
```
# Q 1. List distinct customer type who made complaints.
```sql
select distinct(`customer type`)  from `service call`
```
# @ 2. Find all the Srvice call from Hydrabad.
```sql
select * from `service call` 
where branch='hyderabad'
```
# Q 3.count the number of complaiants for each branch
```sql
select branch, count(branch) as branch_complaints from `service call` group by branch
```
# Q 4. Find the most common problem 
```sql
select `problem(issue stated by customer)` , count( `problem(issue stated by customer)`)
as total_complaints from `service call` group by `problem(issue stated by customer)`
 order by `problem(issue stated by customer)` desc
limit 1; 
```
# Q 5. Retrive the top 5 branches with the highest number of service call
```sql
select branch, count(branch) as branchwise_call from `service call` 
group by branch
order by  branchwise_call desc
limit 5;
```
# Q 6.identify pattern: wHhich Month have the Highest Complaint Volumnes?
```sql
select max(month) from `service call`
```
# Q 7.which complaint categories have the most unresolved issue(if status is not 'complete').
```sql
select `complaint category`,count(*) as unresolved_call from `service call`  
where status != 'complete' group by `complaint category`
```
