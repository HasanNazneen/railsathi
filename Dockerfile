# Use official Python image
FROM python:3.10-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set work directory
WORKDIR /app

# Install system dependencies
#RUN apt-get update && apt-get install -y netcat && rm -rf /var/lib/apt/lists/*
RUN apt-get update && apt-get install -y netcat-openbsd && rm -rf /var/lib/apt/lists/*

# Install dependencies
COPY requirements.txt /app/
RUN pip install --upgrade pip && pip install -r requirements.txt

# Copy project files
COPY . /app/

# Copy and make wait-for-it.sh executable
COPY wait-for-it.sh /app/wait-for-it.sh
RUN chmod +x /app/wait-for-it.sh


# Run server
CMD ["/wait-for-it.sh", "db:5432", "sh", "-c", "python manage.py migrate && python manage.py runserver 0.0.0.0:8000"]
