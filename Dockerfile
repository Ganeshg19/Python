# Use official Python image
FROM python:3.11-slim

# Install system dependencies
RUN apt-get update && \
    apt-get install -y curl gnupg2 apt-transport-https unixodbc-dev && \
    curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - && \
    curl https://packages.microsoft.com/config/debian/11/prod.list > /etc/apt/sources.list.d/mssql-release.list && \
    apt-get update && \
    ACCEPT_EULA=Y apt-get install -y msodbcsql17 && \
    apt-get clean -y

# Set working directory
WORKDIR /

# Copy project files
COPY . .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose the port your app runs on
EXPOSE 8000

# Run your app
CMD ["python", "main.py"]
