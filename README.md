# 🚀 AWS Blue-Green Deployment using Terraform and CI/CD

This project demonstrates a complete **Blue-Green Deployment strategy** on AWS using **Terraform** for Infrastructure as Code (IaC) and simulates a future extension with CI/CD pipelines (GitHub Actions or Jenkins). It automates infrastructure provisioning, instance rotation, and web server deployments in both staging (Green) and production (Blue) environments.

---

## 🧠 Project Overview

The goal is to build a resilient, zero-downtime deployment system using Blue-Green environments. We spin up EC2 instances in two environments and simulate traffic switching using Application Load Balancer (ALB). The project includes:

- Creating AWS infrastructure with Terraform
- Configuring Blue and Green EC2 instances
- Installing Apache web server and serving different color-coded pages
- Simulating blue-green switching
- Using SSH and security groups
- Performing updates using Terraform

---

## 🧱 Technologies Used

- **Terraform**
- **AWS EC2**
- **AWS Application Load Balancer (ALB)**
- **AWS Security Groups**
- **Amazon Linux 2**
- **Apache Web Server**
- **Git & GitHub**

---

## 📐 Final Architecture Diagram

![Architecture Diagram](screenshots/Untitled%20design.png)

---

## ⚙️ Step-by-Step Process with Screenshots

### 🔧 Step 1: Terraform Init and Plan

Initialized the Terraform workspace and reviewed planned infrastructure.
![Terraform Plan](screenshots/terraform-plan-output-part1.png)

---

### 📦 Step 2: Terraform Apply with Key Pair

Deployed resources including VPC, subnets, instances, security groups, and ALB.
![Apply Output](screenshots/terraform-apply-with-key-output.png)

---

### 📡 Step 3: EC2 Instance Created

Verified EC2 instances (Blue and Green) are running.
![EC2 Instances](screenshots/ec2-instances-public-ip.png)

---

### 🔐 Step 4: Security Group Configuration

Allowed inbound HTTP (port 80) and SSH (port 22).
![Security Group Rule](screenshots/security-group-ssh-rule-added.png)

---

### 🔄 Step 5: Reapply Subnet Fix

Fixed an issue where the subnet was incorrectly configured.
![Subnet Fix](screenshots/terraform-reapply-public-subnet.png)

---

### 🔁 Step 6: Blue-Green Environment Created

Verified both environments are up before traffic switch.
![Before Switch](screenshots/ec2-blue-green-before-termination.png)

---

### 🔑 Step 7: SSH into Blue EC2 Instance

Connected via SSH to install web server.
![SSH Login](screenshots/blue-instance-ssh-login.png)

---

### 🌐 Step 8: Apache Setup on Blue Instance

Installed and enabled Apache, created a simple HTML file.
![Apache Setup](screenshots/instance-apache-setup.png)

---

### 🔵 Step 9: Blue Page Live

Tested ALB DNS and saw **"Hello from BLUE Environment"**.
![Blue Page](screenshots/alb-blue-page-test.png)

---

### 🟢 Step 10: Green Page Live After Switch

Switched traffic to Green and tested output.
![Green Page](screenshots/alb-green-page-test.png)

---

## 🧪 Outcome

- ✅ Blue and Green environments created successfully using Terraform
- ✅ Load balancer served Blue and Green pages with zero downtime
- ✅ SSH access and Apache installation verified
- ✅ Web pages reflected correct environment

---

## 🛠️ Challenges Faced & Solutions

| Problem | Solution |
|--------|----------|
| Git push failed due to large Terraform provider file | Removed `.terraform` folder and re-initialized |
| GitHub refused access from old account | Cleared old credentials & added new SSH key |
| ALB DNS not resolving | Corrected security group & subnet configuration |
| SSH key issues | Regenerated key pair and uploaded public key to GitHub |
| ALB not switching environments | Updated target group and Terraform plan with correct instance attachment |

---

## 📸 Screenshots Gallery

- [x] terraform-plan-output-part1.png
- [x] terraform-apply-with-key-output.png
- [x] ec2-instances-public-ip.png
- [x] security-group-ssh-rule-added.png
- [x] terraform-reapply-public-subnet.png
- [x] ec2-blue-green-before-termination.png
- [x] blue-instance-ssh-login.png
- [x] instance-apache-setup.png
- [x] alb-blue-page-test.png
- [x] alb-green-page-test.png
- [x] architecture diagram (Untitled design.png)

---

## 🔄 Future Improvements

- Automate entire pipeline with **GitHub Actions** or **Jenkins**
- Integrate **Smoke Testing** and **Monitoring**
- Add **Blue-Green Traffic Switch Automation**
- Use **S3 backend** for Terraform state management

---

## 🙌 Author

**Oladapo Adenekan** – Cloud & DevOps Enthusiast  
📍 Mentor, Ohio  
🔗 [GitHub](https://github.com/oladapoade)

---

> 🎯 *This project showcases real-world infrastructure automation and deployment strategy using modern DevOps tools.*
