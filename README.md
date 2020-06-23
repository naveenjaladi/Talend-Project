# Talend-Project
The project include the analysis of data using Talend and Tableau


## Introduction
A project model for XYZ insurance company that requires a data warehouse to ease the analytical problem for policies as they want to expand their business areas. So, to track the business a model is implemented then data is inserted or updated into staging tables then loaded into dimension tables with SCD types where appropriately needed. Business rule is implemented to wash out the un-wanted data using Talend and Visualization of data is done through Tableau.


The aim of the project is to Clean, load data of Customer, Location and Agent, Transaction using Talend Tmap function into staging tables of data warehouse in MySQL and then perform SCD operation with the appropriate type needed and then stored into dimensional tables, business rule is applied in to the transaction table and then policy fact table is created on which business questions are solved and then data is visualized in Tableau. 

## Design Requirements
We are provided with Customer, Agent, Location, Calendar, Transaction details file and database schema is provided that used to create staging tables and dimensions tables 

## Tools used
We have used SQL for database management and Querying, Talend for ETL process and Tableau for data visualization.

## Process Flow
Initially the provided data files which are given in an excel format are used to create metadata of data and even schema of excel files and then cleaned by using Tmap function. We have inconsistent data in Customer file and Location file, so they are cleaned by using Tmap and remaining files are loaded directly except calendar.
Staging is the process of inserting the data into database then clean data from the Tmap are loaded into staging database as initial data may be inconsistent. It can be also helpful in checking the data and their data type and if encountered any remedy to data it can be truncated. Customer, Agent, Location, Transaction and calendar files are provided. Four staging tables are created and loaded with files except Calendar file because no processing is required for calendar which can be directly loaded into dimension table.


Business rule is applied to transaction table so that data transaction with incorrect dimensions will not be loaded into fact table which do not have incorrect Agent_id and Customer_id. Then data is loaded into dimension tables by using SCD with appropriate types needed. SCD captures the changes in the data. 
Types of SCD:
1.	Type 0- Fixed Dimension no changes are allowed.
2.	Type 1- No history records are maintained or updates record.
3.	Type 2- Track changes in version and assign a flag value.
4.	Type 3- Add a column to show previous column.
SCD type 1 for location dimension so that it update the value if data already exists and SCD type 2 is used for Customer and agent dimension so that create a new record and assign end to the old record and sets flag value as 0, then creates new record with the updated data and assign flag value as 1. In SCD this flag will be automatically generated column as scd_active.
Tableau is used to visualize and in determining the business questions.

## Business Questions answered
1. What is the total revenue for New business in 2011 ?
2. What is the total new business transactions amount per Agent?
3. Who are top three performing agents for renewals?
4. What is most popular payment method?

## Visualization
By using Tableau we have Visualized the four business questions
