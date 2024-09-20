# Use the official Microsoft SQL Server image as a base
FROM mcr.microsoft.com/mssql/server:2019-latest

LABEL maintainer="DhillanC"

# Switch to the root user to perform administrative tasks
USER root

# Set environment variables for SQL Server
ENV SA_PASSWORD=Inca2024!
ENV ACCEPT_EULA=Y

# Create a directory for SQL initialization scripts
RUN mkdir /usr/src/app
RUN mkdir /var/opt/mssql/backup

# Copy the initialization script into the container
COPY bdi_prd.bak /var/opt/mssql/backup/
COPY init-db.sh /usr/src/app/

# Run the initialization script
RUN chmod +x /usr/src/app/init-db.sh

# Switch back to the default SQL Server user
USER mssql

# Run the SQL Server and initialization script
CMD ["/bin/bash", "-c", "/usr/src/app/init-db.sh & /opt/mssql/bin/sqlservr"]
