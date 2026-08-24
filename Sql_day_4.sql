show databases;
create database BankingDB;
use BankingDB;


CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    AccounCreationDate DATE
);
    
describe Customers; 

CREATE TABLE Accounts (
    AccountID INT,
    AccountType VARCHAR(20),
    Balance DECIMAL(10 , 2 )
);

describe Accounts;

CREATE TABLE Transactions (
    TransactionID INT,
    TransactionDate DATE,
    Amount DECIMAL(10 , 2 ),
    TransactionType VARCHAR(20)
);

describe Transactions;

CREATE TABLE Branches (
    BranchID INT,
    BranchName VARCHAR(100),
    BranchAddress VARCHAR(200),
    BrachPhone VARCHAR(15)
);

describe Branches;

CREATE TABLE AccountBranches (
AssignmentDate DATE
); 

describe AccountBranches;

alter table branches
add primary key (BranchID);

CREATE TABLE Loans (
    LoanID INT,
    LoanAmount DECIMAL(10 , 2 ),
    InterestRate DECIMAL(10 , 2 ),
    StartDate DATE,
    EndDte DATE
);

describe Loans;

use sakila;

select * FROM Customers;

Alter table Customers
ADD DateOfBirth  Date;

alter table customers
modify Phone varchar(20);

drop table accountbranches;

show tables;

alter table accounts
add CustomerID INT;

Alter table Accounts
add constraint FK_Accounts_Customers
foreign key (CustomerID)
referenceS Customers(CustomerID);

DESC accounts;
DESC customers;
desc branches;

alter table Customers
add constraint uq_email unique (Email);

ALTER TABLE accounts
add BranchID INT;

ALTER TABLE Accounts
ADD constraint FK_Branches_Accounts1
FOREIGN KEY (BranchID)
references Branches(BranchID);

alter table accounts
add primary key (AccountID);

alter table transactions
add primary key (TransactionID);

DESC transactions;

Alter table transactions
add AccountID INT;

Alter table Transactions
add constraint FK_Transaction_Accounts1
foreign key (AccountID)
references Accounts(AccountID);

DESC LOANS;

Alter table loans
add customerid int;

alter table loans
add constraint FK_LOANS_CUSTOMER
foreign key (CustomerID)
references customers(CustomerID);

select * from customers;

desc customers;

alter table CustomerS add column PAN VARCHAR(20);
alter table CustomerS add column PAN VARCHAR(20) first;
alter table CustomerS add column PAN VARCHAR(20) after email;
alter table CustomerS modify column PAN VARCHAR(50);
 
Alter table customers drop PAN;

insert into customers values (101, 'Rahul','Sharma','ragulsharma@gmail.com',9876543210,'2019-09-28','1998-03-23');
insert into customers values (102, 'Rahul','Sharma','rahulsharma@gmail.com',9876543210,'2019-09-28','1998-03-23');

insert into customers(customerid,email,phone)
values (103,'abi@gmail.com', 124578),
(104,'hi@gmail.com',876554);

desc accounts;
insert into accounts (accountID,CustomerID,AccountType,Balance)
values (201,101,'Savings',280000);

insert into accounts (accountID,CustomerID,AccountType,Balance)
values (202,102,'Current',280000);

update customers set Phone='9888888888' where CustomerID=101;

delete from accounts where AccountID=202;

select * from customers;
select * from accounts;
select * from transactions;

delete from customers where customerid >101;

alter table customers drop AccounCreationDate;

insert into customers values 
(102,'Priya','Patil','priya@gmail.com',9988776655,'2000-09-20'),
(103,'Amit','Patel','amit.patel@gmail,com',9876500001,'1995-06-18');

insert into customers values 
(104,'Sneha','Joshi','sneha.joshi@gmail.com',987650002,'1997-09-12'),
(105,'Rohan','Kulkarni','rohan.k@gmail.com',9876500003,'1993-11-25');

desc customers;

insert into accounts
(accountid,customerid,accounttype,balance)
values
(202,102,'Current',40000),
(203,103,'Savings',45000),
(204,104,'Current',60000),
(205,105,'Savings',45000);

select * from customers
where customerid in (101,102,103);

desc accounts;

select * from accounts
where accounttype = 'Current';

select * from accounts
where balance < 45000;

select * from accounts;

select * from customers
where customerid in (104,105);

select* from customers
where FirstName like 'S%';

select * from CUSTOMERS 
order by lastname desc;


select * from transactions;

insert into transactions values 
(301,'2025-05-10',5000,'Deposit',201),
(303,'2025-05-12',10000,'Deposit',203),
(304,'2025-05-13',3000,'Withdraw',204),
(305,'2025-05-14',7000,'Deposit',205);

select * from transactions
order by amount desc
limit 5;

select distinct transactiontype from transactions;

select * from transactions
limit 3,2;

select * from transactions
where amount between 1000 and 8000;

select *  from accounts
order by balance desc
limit 3;

select * from transactions
limit 4 offset 2;

select accountID, balance,
case 
when balance >= 50000 then 'Premium Account'
when balance >= 25000 then 'Standard Account'
else 'Basic account'
end as AccountCatogery
from accounts;

select Accountid, balance,
dense_rank() over(order by balance desc)
 as BalanceRank
from accounts;

select * from transactions;
insert into transactions values (302,'2025-05-11',2500,'Withdraw',202);

select transactionID, AMOUNT,
sum(amount) over(order by transactiondate) as RunningTotal
from transactions;

select transactionID, AMOUNT,
sum(amount) over() as RunningTotal
from transactions;

select transactionid, amount, 
avg(amount) over() as avgtransaction
from transactions;

