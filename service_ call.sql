use swati;
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
select * from `service call`
 

# List distinct customer type who made complaints.
select distinct(`customer type`)  from `service call`

#Find all the Srvice call from Hydrabad.
select * from `service call` 
where branch='hyderabad'

# count the number of complaiants for each branch
select branch, count(branch) as branch_complaints from `service call` group by branch

# Find the most common problem 
select `problem(issue stated by customer)` , count( `problem(issue stated by customer)`)
as total_complaints from `service call` group by `problem(issue stated by customer)`
 order by `problem(issue stated by customer)` desc
limit 1; 

# Retrive the top 5 branches with the highest number of service call
select branch, count(branch) as branchwise_call from `service call` 
group by branch
order by  branchwise_call desc
limit 5;

#identify pattern: wHhich Month have the Highest Complaint Volumnes?
select max(month) from `service call`

# which complaint categories have the most unresolved issue(if status is not 'complete').
select `complaint category`,count(*) as unresolved_call from `service call`  
where status != 'complete' group by `complaint category`