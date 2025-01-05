# **Day 39: AWS and IAM Basics**

## **Overview**
This document outlines the key learnings and tasks completed on Day 39 of the AWS learning journey. The focus was on automating EC2 instance setup using User Data and exploring IAM (Identity and Access Management) concepts, including creating roles for various use cases.

---

## **AWS**

### **User Data in AWS**
When launching an EC2 instance, you can pass **User Data** to:
- Automate configuration tasks.
- Install applications like Apache, Docker, or Jenkins.

**Types of User Data**:
- **Shell Scripts**: For running commands.
- **Cloud-init Directives**: For more complex setups.

**How to Pass User Data**:
- Directly in the **Launch Instance Wizard**.
- As a file (useful for CLI or scripts).
- Base64-encoded (for API calls).

This feature simplifies repetitive setup tasks and ensures consistency.

---

## **IAM (Identity and Access Management)**
IAM helps securely manage access to AWS resources by controlling authentication and authorization.

### **Key Concepts**:
1. **Users**:
   - Represent individual identities needing access.
   - Have specific credentials like passwords or access keys.
2. **Groups**:
   - Collections of users with shared permissions.
   - Simplifies management by assigning permissions to the group instead of individual users.
3. **Roles**:
   - Temporary permissions assigned to AWS services or external entities.
   - Avoids sharing long-term credentials.

---

## **Tasks Completed**

### **Task 1: Automate Jenkins Installation on EC2**
- **Goal**: Launch an EC2 instance with Jenkins pre-installed using **User Data**.
- **Steps**:
  1. Created a User Data script:
     ```bash
     #!/bin/bash
     sudo apt update
     sudo apt install -y fontconfig openjdk-17-jre
     java -version
     sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
       https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
     echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" \
       https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
       /etc/apt/sources.list.d/jenkins.list > /dev/null
     sudo apt-get update
     sudo apt-get install -y jenkins
     sudo systemctl start jenkins
     sudo systemctl enable jenkins
     ```
  2. Passed the script in the **Advanced Details > User Data** section during instance launch.
  3. Verified Jenkins by accessing the instance IP on port `8080`.

- **Outcome**: Successfully launched an EC2 instance with Jenkins running.

### **Task 2: Create IAM Roles**
- **Goal**: Create IAM roles for specific use cases.
- **Roles Created**:
  1. **DevOps-User**:
     - Permissions: `AmazonEC2FullAccess`, `AWSCodePipelineFullAccess`, `AmazonS3FullAccess`.
  2. **Test-User**:
     - Permissions: `AmazonEC2ReadOnlyAccess`, `AWSCodeBuildReadOnlyAccess`, `AmazonS3ReadOnlyAccess`.
  3. **Admin**:
     - Permissions: `AdministratorAccess`.

---

## **Takeaways**
- **User Data** simplifies EC2 instance setup, enabling automation and saving time.
- **IAM Roles** provide secure and temporary access to AWS resources, enhancing security and flexibility.
- **Cloud Skills**: Mastering automation and access management are key steps in becoming proficient with AWS.

---

## **Next Steps**
- Dive deeper into AWS automation using CloudFormation and Terraform.
- Explore advanced IAM configurations like service control policies (SCPs) and access analyzer.

---

**Happy Learning!** 🎉

#AWS #IAM #CloudComputing #Automation #DevOps
