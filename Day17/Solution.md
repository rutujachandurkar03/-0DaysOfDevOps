#Why Containerize with Docker?
Using Docker, I created a consistent environment for the Django app, simplifying deployment across different platforms. By creating a Dockerfile, I was able to define the setup in a single file, which means anyone can replicate the environment simply by running Docker commands.

#what my Dockerfile does:
1.	Base Image: Starts with an official Python image for a stable, well-maintained environment.
2.	Working Directory Setup: Sets up a dedicated directory in the container to avoid clutter and keep the app organized.
3.	Dependencies Installation: Installs required packages from requirements.txt, ensuring the app has all the necessary libraries.
4.	App Copying: Copies the Django app files into the container for self-contained execution.
5.	Expose and Run: Exposes the port for the Django development server and runs the app.

Dockerfile Workflow Summary:
#Base Image
FROM python:3.7

#working Directory

WORKDIR /app

#copy code
COPY . .

#install libraries

RUN pip install -r requirements.txt

#migrations

RUN python todo/manage.py migrate

#run app
CMD ["python", "todo/manage.py", "runserver","0.0.0.0:8000"]

🔹 docker build – to build the Docker image
🔹 docker run – to start the container
🔹 docker push – to upload the image to a repository
🔹 docker inspect – to verify configurations
This project was a great hands-on experience in Dockerizing an application, setting up dependencies, and understanding best practices in containerization. I’m excited to continue building on these DevOps skills!


