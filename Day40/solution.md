# AWS EC2 Automation - Day 40

## Overview
This project focuses on automating EC2 workflows in AWS by leveraging **Launch Templates**, **User Data Scripting**, and **Auto Scaling Groups**. The goal is to streamline the deployment of instances with pre-configured environments for Jenkins and Docker.

---

## Key Components

### 1. **Launch Templates**
A launch template was created with the following configurations:
- **AMI**: Amazon Linux 2
- **Instance Type**: t2.micro
- **User Data**: Script to install and configure Jenkins and Docker automatically

### 2. **User Data Script**
The following script was used to automate the setup of Jenkins and Docker:

```bash
#!/bin/bash
sudo yum update -y
sudo yum install -y docker
sudo service docker start
sudo usermod -a -G docker ec2-user

sudo yum update -y
sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key

sudo yum upgrade -y
sudo dnf install java-17-amazon-corretto -y
sudo yum install jenkins -y
sudo systemctl enable jenkins
sudo systemctl start jenkins
sudo systemctl status jenkins
```

### 3. **Instance Scaling**
- Launched **3 instances** simultaneously using the configured launch template.
- Explored **Auto Scaling Groups** for dynamic scaling based on workload demands.

---

## Steps to Reproduce

1. **Create a Launch Template**
   - Navigate to the AWS EC2 Dashboard.
   - Create a new Launch Template with:
     - **AMI**: Amazon Linux 2
     - **Instance Type**: t2.micro
     - Add the User Data script above.

2. **Launch Instances**
   - Use the created Launch Template to launch instances.
   - Set the desired number of instances (e.g., 3).

3. **Configure Auto Scaling Group** (Optional)
   - Create an Auto Scaling Group linked to the Launch Template.
   - Define scaling policies and instance limits.

---

## Benefits of Automation
- **Consistency**: Ensures all instances are deployed with the same configuration.
- **Efficiency**: Reduces manual effort in setting up environments.
- **Scalability**: Enables seamless scaling to meet workload demands.

---

## Future Enhancements
- Automate Auto Scaling Group setup via AWS CLI or CloudFormation.
- Integrate monitoring tools like CloudWatch for proactive scaling.
- Explore Spot Instances for cost optimization.

---

## Resources
- [AWS EC2 Documentation](https://docs.aws.amazon.com/ec2/)
- [Jenkins Installation Guide](https://www.jenkins.io/doc/book/installing/)
- [Docker Documentation](https://docs.docker.com/)

---

### Author
Documented and automated by: [Your Name]

---
