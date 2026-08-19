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