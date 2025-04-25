#!/usr/bin/env bash
set -e

# Install system dependencies
apt-get update
apt-get install -y curl gnupg2 unixodbc-dev

# Add Microsoft SQL Server ODBC driver repository
curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
curl https://packages.microsoft.com/config/debian/10/prod.list > /etc/apt/sources.list.d/mssql-release.list

# Install SQL Server ODBC driver
apt-get update
ACCEPT_EULA=Y apt-get install -y msodbcsql17
