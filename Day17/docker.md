
# Docker Guide for Django-to-do Project

This guide will walk you through the steps to containerize the Django-to-do project and run it using Docker.

### Prerequisites
Ensure Docker is installed and running on your machine.

### Steps

1. **Clone the Repository**

   Clone the Django-to-do project from GitHub:
   ```bash
   git clone https://github.com/OmkarPathak/Django-to-do.git
   cd Django-to-do/
   ```

2. **Create a Dockerfile**

   In the project directory, create a `Dockerfile` with the following content to set up the environment and dependencies:

   ```Dockerfile
   # Use Python base image
   FROM python:3.8

   # Set the working directory in the container
   WORKDIR /app

   # Copy the requirements file and install dependencies
   COPY requirements.txt .
   RUN pip install -r requirements.txt

   # Copy the project files
   COPY . .

   # Expose port 8000 for Django
   EXPOSE 8000

   # Command to run the application
   CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
   ```

3. **Build the Docker Image**

   Build the Docker image with a tag (e.g., `django_todo`):
   ```bash
   docker build -t django_todo .
   ```

4. **Verify the Image**

   List Docker images to verify the `django_todo` image is created:
   ```bash
   docker images
   ```

5. **Run the Docker Container**

   Run the container, mapping port 8000 to your local machine:
   ```bash
   docker run -d -p 8000:8000 django_todo:latest
   ```

6. **Check Running Containers**

   Verify that the container is running:
   ```bash
   docker ps
   ```

7. **Stop and Remove a Container**

   To stop and remove a container, find the container ID using `docker ps` and run:
   ```bash
   docker stop <container_id> && docker rm <container_id>
   ```

### Additional Commands

- **Rebuild the Image:** If you make changes to the `Dockerfile` or the application code:
  ```bash
  docker build -t django_todo .
  ```

- **View Logs:** To view logs of the running container:
  ```bash
  docker logs <container_id>
  ```

### Access the Application

Open a web browser and go to `http://localhost:8000` to view the Django-to-do application.
