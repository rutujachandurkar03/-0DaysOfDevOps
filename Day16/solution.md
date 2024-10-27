🚀Docker is a software platform that allows you to build, test, and deploy applications quickly. Docker packages software into standardized units called containers that have everything the software needs to run, including libraries, system tools, code, and runtime. Using Docker, you can quickly deploy and scale applications into any environment and know your code will run.

🔹 docker run: Started a container with docker run hello-world to confirm Docker’s ready to go!

	This command runs a simple "Hello World" container, confirming Docker is installed correctly and can run containers.

🔹 docker inspect: Explored the ins and outs of a container’s configuration, network settings, and more.

	Example: docker inspect <container_id>
This command provides detailed JSON output about a container or image, including configuration details, network settings, and mount points.

🔹 docker port: Checked port mappings, essential for connecting services across containers and hosts.

	Example: docker port <container_id>
Lists the port mappings for a container, showing which ports on the host are connected to ports in the container.

🔹 docker stats: Monitored container resource usage – think CPU, memory, and network usage in real-time.

	 Example: docker stats <container_id>
Shows live resource usage statistics (CPU, memory, network, etc.) for one or more containers, useful for performance monitoring.

🔹 docker top: Peeked inside to see processes running within a container.

	Example: docker top <container_id>
Displays running processes within a container, similar to the Linux top command for the host system.

🔹 docker save and docker load: Practiced saving and loading images for backup and sharing.

	Example: docker save -o <path>/<image_name>.tar <image_name>
Saves an image to a tar archive, useful for backing up or sharing Docker images.

	Example: docker load -i <path>/<image_name>.tar
Loads a Docker image from a tar archive, useful for restoring or distributing Docker images without pulling them from a repository.


Docker is truly simplifying the development-to-deployment journey by ensuring apps can run reliably across different environments! 🔄

