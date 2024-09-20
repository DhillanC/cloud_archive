#!/bin/bash
# Wait for SQL Server to start
sleep 30s

# Run the initialization commands or scripts
#/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "Inca2024!" -i /usr/src/app/initialize-database.sql

# Restore the database from the backup file
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "Inca2024!" -Q "RESTORE DATABASE BDI_PRD FROM DISK = '/var/opt/mssql/backup/backupfile.bak' WITH REPLACE"
