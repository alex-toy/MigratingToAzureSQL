Migrating to Azure SQL
=
In this project, we will be migrating to Azure SQL and running a SQL script to migrate the schema and data.

In order to execute the bellow instructions, you only need to run commands\Configs\config.ps1. All the resources will automatically be deployed for you.

## Create Azure resources
1. Create a resource group
    - Name: sql-xxx-rg (where xxx is a random number)
    - Region: closest region
2. Create SQL Server
    - Name: db-server-xxx (xxx should match the number set in your resource group)
    - username: sql_admin
    - password: P@ssword
    - Allow public connectivity
    - Enable Access to all Ip Addresses
3. Create Database Server
    - Name: MyDatabase

## Perform the migration
1. Run the schema-data-script.sql by connecting to the Database using one of these options:
    - the Azure portal: Query Editor
    - Visual Studio Code SQL Server extension
    - Microsoft SQL Server Management Studio
    - Cleanup and delete resources

Be sure to cleanup and delete resources to avoid recurring charges