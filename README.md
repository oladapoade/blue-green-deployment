# 🚀 AWS Blue-Green Deployment with Terraform and CI/CD

This project demonstrates how to implement Blue-Green Deployment on AWS using Terraform for infrastructure provisioning and a CI/CD pipeline (e.g., GitHub Actions or Jenkins) for automated deployment.

---

## 🖼️ Architecture Diagram

![Architecture Diagram](screenshots/Untitled%20design.png)

---

## 💡 Technologies Used

- **Terraform** – Infrastructure as Code (IaC)
- **AWS EC2** – Virtual Machines
- **AWS ALB (Application Load Balancer)** – To route traffic between Blue and Green environments
- **Git & GitHub** – Version control and CI/CD trigger
- **Amazon Linux 2** – EC2 AMI
- **Apache Web Server** – To simulate application deployment

---

## 🧠 Project Overview

The goal is to simulate Blue-Green Deployment using two EC2 instances ("Blue" and "Green") attached to an ALB. Blue serves as the live environment. Green is used for staging new releases. Once the Green environment passes health checks, traffic is routed to it via the ALB.

---

## ⚙️ Step-by-Step Deployment

### 1. ✅ Terraform Initialization and Plan

Terraform was initialized and a plan was created to spin up all necessary infrastructure.

![Terraform Plan Part 1](screenshots/terraform-plan-output-part1.png)
![Terraform Plan Part 2](screenshots/terraform-plan-output-part2.png)

---

### 2. 🚀 Applied Terraform Infrastructure

Resources were deployed: VPC, Subnets, Security Groups, EC2 Instances (Blue & Green), Target Groups, and ALB.

![Terraform Apply Output](screenshots/terraform-apply-output-with-alb.png)

---

### 3. 🧩 Security Group Configuration

Port 22 (SSH) and 80 (HTTP) were opened to the world in the security group for access and testing.

![Security Group SSH Rule](screenshots/security-group-ssh-rule-added.png)

---

### 4. 🌐 Verified EC2 Instances

We confirmed both the Blue and Green EC2 instances were successfully launched and running.

![EC2 Instances](screenshots/ec2-instances-public-ip.png)

---

### 5. 🔐 SSH into Blue Instance and Installed Apache

Connected to the Blue instance and installed Apache web server:

```bash
sudo yum install httpd -y
sudo systemctl start httpd
sudo systemctl enable httpd
echo "<h1>Hello from BLUE Environment</h1>" | sudo tee /var/www/html/index.html

