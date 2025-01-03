# Day 39: AWS and IAM Basics ☁

## **AWS: Getting Started with Automation**
By now, you have likely created multiple EC2 instances and manually installed applications like Jenkins and Docker. Today, let's take the next step toward automation. Sounds interesting? 🤯

---

### **AWS Overview**
Amazon Web Services (AWS) is one of the most popular cloud providers, offering a **Free Tier** for students and cloud enthusiasts. This allows hands-on practice without incurring costs while learning.

- **[Sign up for AWS Free Tier](https://aws.amazon.com/free/)** to explore its offerings.
- Learn more about **[AWS](https://aws.amazon.com/)**.

---

### **User Data in AWS**
When launching an EC2 instance in AWS, you can pass **user data** to perform automated configuration tasks and run scripts. This saves time and reduces manual effort during instance setup.

#### **Types of User Data**
1. **Shell Scripts**: Execute commands automatically after the instance starts.
2. **Cloud-init Directives**: Automate instance configuration using cloud-init.

#### **Ways to Pass User Data**
- **Plain Text**: Enter directly in the launch instance wizard.
- **File Upload**: Useful when using CLI tools.
- **Base64-encoded Text**: For API calls.

#### **Benefits**
Automating installations (e.g., Apache, Docker, Jenkins) with user data makes instance management more efficient.

- Learn more about **[User Data in AWS](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/user-data.html)**.

---

### **IAM: Identity and Access Management**
AWS IAM helps you securely control access to AWS resources by managing authentication and authorization.

#### **Core Concepts**
- **Users**: Individual accounts with specific permissions.
- **Groups**: Logical collections of users sharing permissions.
- **Roles**: Temporary permissions assigned to AWS resources or users.

- Learn more about **[IAM](https://aws.amazon.com/iam/)**.
- Dive deeper into **[IAM Documentation](https://docs.aws.amazon.com/IAM/latest/UserGuide/introduction.html)**.

---

## **Tasks**

### **Task 1: Automate Jenkins Installation Using User Data**
1. **Launch an EC2 Instance**:
   - Use the AWS Management Console to launch a new EC2 instance.
   - Provide user data to automate Jenkins installation.

#### **Sample User Data Script (Ubuntu)**
```bash
#!/bin/bash
sudo apt update -y && sudo apt upgrade -y
sudo apt install -y openjdk-11-jdk
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
echo "deb http://pkg.jenkins.io/debian-stable binary/" | sudo tee /etc/apt/sources.list.d/jenkins.list
sudo apt update -y
sudo apt install -y jenkins
sudo systemctl start jenkins
sudo systemctl enable jenkins
echo "Jenkins installed and ready to use!"
```
2. **Verify Installation**:
   - Once the server shows up in the console, copy its IP address.
   - Open the IP address in your browser; the Jenkins page should be visible.

3. **Submit Proof**:
   - Take screenshots of:
     - The **User Data** provided during instance creation.
     - The **Jenkins landing page**.

---

### **Task 2: Learn and Create IAM Roles**
1. **Learn IAM Concepts**:
   - Understand **Users**, **Groups**, and **Roles**.
   - Document these in your own terms.

2. **Create IAM Roles**:
   - Create the following roles in IAM:
     - `DevOps-User`
     - `Test-User`
     - `Admin`

---

## **Share Your Progress**
Post your progress on LinkedIn and inspire others to learn about AWS and IAM. 🎉

### **Happy Learning! :)**

