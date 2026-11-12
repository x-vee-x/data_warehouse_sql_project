/*
Create Database and Schemas
---------------------------------------------------------------
Script Purpose:
    This script creates a new database named 'data_warehouse' after checking if it already exists.
    If the database exists, it is dropped and recreated. Additionally, the script sets up three schemas
    within the database: 'bronze', 'silver', and 'gold'.

WARNING:
    Running this script will drop the entire 'data_warehouse' database if it exists.
    All data in the database will be permanently deleted. Proceed with caution
    and ensure you have proper backups before running this script.
*/

use master ;
Go

-- drop and recreate 'data_warehouse' database if exists
if exists (
select 1
from sys.databases
where name='data_warehouse')

begin
alter database data_warehouse
set single_user with rollback immediate;
drop database data_warehouse;
end;
go

-- create 'data_warehouse' database
create database data_warehouse;
go

use data_warehouse;
go

-- create schemas
create schema bronze;
go

create schema silver;
go

create schema gold;
go
