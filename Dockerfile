# Use an official Python 3 image from the Docker Hub
FROM python:3

# Set the working directory inside the container
WORKDIR /app

# Copy the requirements.txt (or copy all files if you don't use it)
# If you have a requirements.txt, copy it first to leverage Docker cache
COPY requirements.txt /app/

# Install project dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Alternatively, if you're not using a requirements.txt file,
# You can install Django and other dependencies directly
# RUN pip install django==3.2
# RUN pip install other-dependencies

# Copy the rest of the project files into the container
COPY . /app/

# Set environment variable for Django settings (if needed)
# ENV DJANGO_SETTINGS_MODULE=myproject.settings

# Run Django migrations to set up the database
RUN python manage.py migrate

# Expose port 8000 for the Django development server
EXPOSE 8000

# Run the Django development server (listen on all interfaces)
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

