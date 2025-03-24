# 🚀 AWS Blue-Green Deployment using Terraform and CI/CD Automation

## 📘 Project Overview

This project showcases how I designed and implemented a **Blue-Green Deployment strategy on AWS** using **Terraform** for Infrastructure as Code (IaC). The goal was to automate infrastructure deployment while achieving **zero-downtime deployments** by alternating traffic between two identical environments (Blue and Green) through an **Application Load Balancer (ALB)**.

Both environments host EC2 instances with Apache web servers displaying distinct pages, making it easy to verify traffic routing. I also included CI/CD considerations and detailed documentation.

---

## 🧰 Tools & Technologies

- **Terraform**
- **AWS EC2, ALB, VPC, Security Groups**
- **Apache HTTP Server**
- **Git & GitHub**
- **Ubuntu Linux**
- **Visual Studio Code**
- **Canva (for diagram design)**

---

## 📊 Architecture Diagram

![Architecture Diagram](Untitled%20design.png)

This architecture consists of:
- Two EC2 environments: Blue and Green
- Application Load Balancer (ALB)
- Target Groups and Security Groups
- Apache Web Servers installed via Terraform `user_data`
- Manual switching between blue and green targets in this setup

---

## 🧱 Step-by-Step Implementation

### ✅ Step 1: Terraform Initialization and Provider Setup

Configured the AWS provider and backend in `provider.tf`. Initialized the project using:

```bash
terraform init
✅ Step 2: Terraform Plan to Preview Changes
Before applying the infrastructure, I ran:

bash
Copy
Edit
terraform plan
This helped ensure resources were correctly defined and ready for deployment.

Screenshot:


✅ Step 3: Security Group and Networking Setup
Defined a Security Group to allow:

SSH (Port 22) for remote access

HTTP (Port 80) for web access

Screenshot:


✅ Step 4: Blue and Green EC2 Instances with Apache
Used separate Terraform files (blue.tf, green.tf) to create two EC2 instances in different environments.

Each instance used user_data to automatically:

Install Apache

Create a custom index.html page (Blue or Green)

Screenshot:


✅ Step 5: Application Load Balancer Configuration
Deployed an Application Load Balancer (ALB) that:

Routes HTTP traffic to either blue or green environment

Can be switched manually for testing

Screenshot:


✅ Step 6: Outputs and Verification
After applying, I used outputs.tf to display:

Public IPs for each EC2 instance

SSH key file name

This allowed easy access and verification.

Screenshot:


✅ Step 7: SSH into Blue Instance for Validation
I connected to the Blue EC2 instance using SSH and confirmed the web server was running correctly.

Screenshot:


✅ Step 8: Web Page Verification via ALB
After deployment, I tested the ALB DNS URL in the browser. Initially, it routed to the Blue instance:

Screenshot:


Then, after switching the ALB target group manually, I validated the Green instance response:

Screenshot:


⚠️ Problems Faced & Solutions
❌ Issue: SSH Failed to Connect
Cause: Missing SSH rule in Security Group

Fix: Added inbound rule for port 22 and re-applied Terraform

❌ Issue: No Public IP in Output
Cause: Incorrect Terraform reference

Fix: Updated outputs.tf with proper resource names

hcl
Copy
Edit
output "blue_instance_ip" {
  value = aws_instance.blue.public_ip
}
❌ Issue: Ping Test Not Working
Cause: UFW firewall enabled on EC2

Fix: Disabled UFW temporarily and confirmed SSH worked properly

🎯 Key Takeaways
Implemented zero-downtime deployment using Blue-Green strategy.

Learned to organize Terraform files modularly for clarity and reuse.

Automated instance configuration using user_data.

Successfully routed and tested traffic through an ALB.

Strengthened troubleshooting and debugging skills.

🚀 Future Enhancements
Implement GitHub Actions to automate the Terraform deployment pipeline.

Use Route 53 for DNS-based failover.

Add Health Checks to dynamically switch traffic based on instance health.

Automate blue-green switch logic via Terraform or external scripts.

👨‍💻 About Me
Oladapo Adenekan
Enthusiastic Cloud & DevOps Engineer
📧 Email: adenekanoladapo302@gmail.com
🔗 GitHub: @oladapoade
🔗 LinkedIn: linkedin.com/in/oladapo568

