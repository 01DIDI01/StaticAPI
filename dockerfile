# Use an official Python runtime as the base image
FROM python:3.9-slim

# Set the working directory to /app inside the container
WORKDIR /app

# Copy the current directory contents (your Flask app) into the container at /app
COPY . /app

# Install dependencies listed in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Expose port 5000 so we can access the Flask app from the host machine
EXPOSE 5000

# Set the environment variable for Flask
ENV FLASK_ENV=production

# Run the Flask application
CMD ["python", "main.py"]
