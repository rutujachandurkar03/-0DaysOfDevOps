This a project


🔹 Multi-Container Setup: Defined a docker-compose.yml file to bring up both the Flask app and MySQL database together in a single command. This made starting, stopping, and scaling services a breeze.


🔹 Data Persistence with Docker Volumes: Implemented Docker Volumes to store MySQL data outside the container, ensuring that data remains safe and persistent even when containers are restarted.

🔹 Container Communication with Docker Networks: Created an isolated Docker network allowing the Flask app and database to communicate securely, making this setup robust and production-ready.


Key Commands and Steps:

1️.Built the Flask Application Image:
docker build -t flaskapp .
Created a Docker image for the Flask app, ready for deployment.


2️. Set Up a Custom Network:
docker network create -d bridge twotier
Created an isolated twotier network for secure container-to-container communication.


3️.Started the MySQL Database with Persistent Storage:
docker run -d --name mysql -v mysql-data:/var/lib/mysql --network=twotier -e MYSQL_DATABASE=mydb -e MYSQL_ROOT_PASSWORD=admin -p 3306:3306 mysql:5.7
Used a Docker volume mysql-data to persist database files, even if the container is removed.


4️.Deployed the Flask Application and Connected to MySQL:
docker run -d --name flaskapp --network=twotier -e MYSQL_HOST=mysql -e MYSQL_USER=root -e MYSQL_PASSWORD=admin -e MYSQL_DB=mydb -p 5000:5000 flaskapp:latest


Launched the app container, connected it to the MySQL container on the same network, and configured environment variables for easy database access.

5️.Verified Running Containers:
docker ps -a


