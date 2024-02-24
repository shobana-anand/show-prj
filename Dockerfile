# Use a Python base image
FROM python:3.12.1

# Set the working directory in the container
WORKDIR /app

# Copy requirements.txt to the working directory
COPY requirements.txt .

# Install dependencies
RUN python3 -m pip install --no-cache-dir -r requirements.txt

# Copy the application code to the working directory
COPY . .

# Copy config and secrets files
COPY config.env .
COPY secrets.env .

# Set the environment variable to use the config and secrets files
ENV CONFIG_ENV=config.env
ENV SECRETS_ENV=secrets.env

# Copy the Python files into the container
COPY app.py .

# Expose the port on which the Flask app runs
EXPOSE 5153

# Run the Python application
CMD ["python3", "app.py"]