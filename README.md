
# 🚀 AWS Blue-Green Deployment with Terraform and CI/CD

This project demonstrates how to implement **Blue-Green Deployment** on AWS using **Terraform** for infrastructure provisioning and optionally GitHub Actions or Jenkins for CI/CD automation. The goal is to minimize downtime and risk by running two identical production environments (Blue & Green).

---

## 📊 Architecture Diagram

![Architecture](./screenshots/Untitled%20design.png)

---

## 💡 Technologies Used

- **AWS** (EC2, ALB, Target Groups, Security Groups)
- **Terraform**
- **Amazon Linux 2**
- **GitHub**
- (Optional) **CI/CD tools**: GitHub Actions / Jenkins

---

## ⚙️ Step-by-Step Deployment Process

### 1. ✅ Initialize Terraform and Create Infrastructure
We created two EC2 instances (Blue and Green environments), target groups, a security group, and an Application Load Balancer using Terraform.

📸 Screenshot: Terraform Plan Output  
![Terraform Plan](./screenshots/terraform-plan-output-part1.png)

📸 Screenshot: Terraform Apply Output  
![Terraform Apply](./screenshots/terraform-apply-output-with-alb.png)

---

### 2. 🧠 Validate EC2 Instances and Public IPs

We verified that the EC2 instances were created and running. Each instance had a unique public IP and passed health checks.

📸 Screenshot: EC2 Instances Running  
![Instances](./screenshots/ec2-instances-public-ip.png)

---

### 3. 🔐 Configure Security Group

A security group was created to allow **SSH (port 22)** and **HTTP (port 80)** from any IP (`0.0.0.0/0`).

📸 Screenshot: Security Group Rules  
![Security Group](./screenshots/security-group-ssh-rule-added.png)

---

### 4. 🔑 SSH into the EC2 Blue Instance

We used a private key to SSH into the EC2 instance and install a web server.

📸 Screenshot: SSH Login  
![SSH Login](./screenshots/blue-instance-ssh-login.png)

---

### 5. 🌐 Install Apache Web Server and Create HTML Page

Installed Apache (`httpd`) and added a custom HTML file to verify which environment is being served.

📸 Screenshot: Apache Setup  
![Apache](./screenshots/instance-apache-setup.png)

---

### 6. 🔵 View Blue Environment in Browser

After ALB setup, we opened the DNS name of the load balancer and confirmed the message from the Blue environment.

📸 Screenshot: Blue Page Test  
![Blue](./screenshots/alb-blue-page-test.png)

---

### 7. 🟢 Switch to Green Environment

After testing Blue, we switched the ALB target group to Green and updated the instance content.

📸 Screenshot: Green Page Test  
![Green](./screenshots/alb-green-page-test.png)

---

### 8. 🔁 Redeploy and Validate Blue-Green Rotation

We tested Terraform destroy + reapply to simulate Blue-Green deployment transitions.

📸 Screenshot: Reapply Public Subnet  
![Reapply](./screenshots/terraform-reapply-public-subnet.png)

📸 Screenshot: EC2 Before Termination  
![Before Termination](./screenshots/ec2-blue-green-before-termination.png)

---

## 🧩 Problems Encountered & Solutions

| Problem | Solution |
|--------|----------|
| Pushed to wrong GitHub account | Reconfigured Git credentials and SSH key |
| Screenshot folder not showing on GitHub | Manually created `/screenshots` folder and moved images |
| Terraform `.terraform/` folder too large to push | Removed `.terraform` before commit |
| Images not rendering in README | Used relative paths (`./screenshots/image.png`) and ensured all images were committed |

---

## 🎯 Outcome / What I Learned

- Mastered how to set up infrastructure using Terraform.
- Learned about load balancers, health checks, and target groups.
- Understood Blue-Green deployment strategy in real cloud architecture.
- Improved troubleshooting skills across GitHub and AWS.

---

## 🔧 Future Enhancements

You can extend this project with:
- **GitHub Actions / Jenkins pipeline** to automate Terraform deploys.
- **Blue-Green automation logic** to handle ALB switching via Terraform or Lambda functions.

---

## 📂 Project Folder Structure

```
blue-green-deployment/
├── main.tf
├── provider.tf
├── blue.tf
├── green.tf
├── alb.tf
├── outputs.tf
├── screenshots/
│   ├── alb-blue-page-test.png
│   ├── alb-green-page-test.png
│   ├── Untitled design.png
│   ├── ...
└── README.md
```

---

✅ **Done!** Now you have a real-world project to showcase DevOps & Terraform skills.
