# Day 38: Getting Started with AWS Basics ☁

## Congratulations!!!
You've made it this far in your journey! Don't let excuses break your consistency. Let's start a new chapter with **Cloud Computing**! By now, you should have created multiple EC2 instances. If not, don't worry—let's begin the journey together.

---

## **AWS: Amazon Web Services**
Amazon Web Services (AWS) is one of the most popular cloud providers, offering a free tier for students and cloud enthusiasts to practice and gain hands-on experience while learning. 

- **[Sign up for AWS Free Tier](https://aws.amazon.com/free/)** to explore the possibilities.
- Learn more about **[AWS](https://aws.amazon.com/)**.

---

## **IAM: Identity and Access Management**
AWS Identity and Access Management (IAM) is a web service that helps you securely control access to AWS resources. 

- Use IAM to manage who is **authenticated** (signed in) and **authorized** (has permissions) to use AWS resources.
- Centrally manage permissions and access controls.

Learn more about IAM:
- [Introduction to IAM](https://docs.aws.amazon.com/IAM/latest/UserGuide/introduction.html)
- **[Get to Know IAM More Deeply](https://aws.amazon.com/iam/)**

---

## **Tasks**

### **Task 1: Create an IAM User and Launch an EC2 Instance**
1. **Create an IAM User**
   - Create an IAM user with a username of your choice.
   - Grant the user **EC2 Access** using the `AmazonEC2FullAccess` policy or a custom policy.

2. **Launch a Linux Instance**
   - Use the newly created IAM user to log in.
   - Launch a Linux EC2 instance from the AWS Management Console.

3. **Install Jenkins and Docker**
   - SSH into the EC2 instance and use a single shell script to install Jenkins and Docker.

#### Example Shell Script for Ubuntu:
```bash
#!/bin/bash
# Update package list and upgrade packages
sudo apt update -y && sudo apt upgrade -y

# Install Docker
sudo apt install -y docker.io
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker $USER

# Install Java (OpenJDK 11)
sudo apt install -y openjdk-11-jdk

# Add Jenkins repository and install Jenkins
sudo apt install -y wget gnupg
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt update -y
sudo apt install -y jenkins
sudo systemctl start jenkins
sudo systemctl enable jenkins

# Final message
echo "Jenkins and Docker installed successfully on Ubuntu!"
```

---

### **Task 2: Build a DevOps Team of Avengers**
1. **Create IAM Users**
   - Create three IAM users (e.g., `IronMan`, `Thor`, `Hulk`).
   - Provide necessary access credentials.

2. **Create a DevOps Group**
   - Create a group called `DevOps-Team` in IAM.
   - Attach an appropriate IAM policy (e.g., `AdministratorAccess` or a custom DevOps policy).

3. **Add Users to the Group**
   - Assign `IronMan`, `Thor`, and `Hulk` to the `DevOps-Team` group.

---

## **Share Your Progress**
Post your progress on LinkedIn and inspire others to learn and grow in the cloud space. 🎉

### **Happy Learning! :)**

