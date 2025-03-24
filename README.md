
markdown
Copy
Edit
# 🚀 AWS Blue-Green Deployment using Terraform and CI/CD Automation

## 📘 Project Overview

This project demonstrates how I implemented a **Blue-Green Deployment strategy on AWS** using **Terraform** for Infrastructure as Code (IaC). The goal is to ensure **zero-downtime deployments** by routing traffic between two identical environments (Blue and Green) using an **Application Load Balancer (ALB)**.

Each environment runs an EC2 instance configured with Apache web server, displaying distinct pages. Infrastructure is modularized using Terraform and verified via browser and SSH testing. Screenshots document every stage of the deployment process.

---

## 🧰 Tools & Technologies Used

- Terraform  
- AWS EC2, ALB, Security Groups, Subnets  
- Apache HTTP Server (Ubuntu)  
- Git & GitHub  
- Visual Studio Code  
- Canva (for architecture diagram)

---

## 📊 Architecture Diagram

![Architecture Diagram](images/Untitled%20design.png)

This architecture includes:
- Blue and Green EC2 environments
- ALB with listener rules
- Apache servers showing different pages
- Security Groups for SSH and HTTP access
- Modular Terraform files for scalability

---

## 🔧 Step-by-Step Implementation

### ✅ Step 1: Terraform Initialization and Provider Setup

Defined the AWS provider and initialized the project using:

```hcl
provider "aws" {
  region = "us-east-1"
}
Command:

bash
Copy
Edit
terraform init
✅ Step 2: Preview Infrastructure Changes
Executed the plan to review resources before provisioning.

bash
Copy
Edit
terraform plan
Screenshot:

✅ Step 3: Configure Security Groups
Created security groups to allow:

Port 22 for SSH

Port 80 for HTTP

Screenshot:

✅ Step 4: Provision Blue & Green EC2 Instances
Deployed two EC2 instances using blue.tf and green.tf, each with:

Apache installed via user_data

Distinct HTML content to differentiate environments

Screenshot:

✅ Step 5: Configure the Application Load Balancer (ALB)
Used alb.tf to configure an ALB that forwards traffic to either the blue or green target group. Manual switching simulates blue-green deployment.

Screenshot:

✅ Step 6: Output and Verify EC2 Public IPs
Displayed instance IPs using outputs.tf, enabling SSH and browser testing.

hcl
Copy
Edit
output "blue_instance_ip" {
  value = aws_instance.blue.public_ip
}
Screenshot:

✅ Step 7: SSH Into EC2 to Confirm Apache Deployment
Used the key pair to SSH into the EC2 instance and confirm Apache was installed and serving the page.

Screenshot:

✅ Step 8: Validate Web Pages Through ALB
Tested the ALB DNS in a browser to verify:

Blue Environment Page:

Green Environment Page:

⚠️ Problems Faced & Solutions
❌ Problem 1: SSH Not Working
Cause: Port 22 not open in the security group
Fix: Added SSH rule and re-applied Terraform

❌ Problem 2: Public IP Not Showing
Cause: Missing output reference
Fix: Added public IP output block in outputs.tf

❌ Problem 3: Ping Failing to EC2
Cause: UFW firewall blocking ICMP
Fix: Disabled UFW temporarily to test and confirmed access

🎯 Key Takeaways
Built reusable, modular Terraform code

Demonstrated zero-downtime deployment using ALB

Automated Apache installation using user_data

Successfully routed traffic between environments

Documented entire process with real screenshots

🚀 Future Improvements
Automate switching between blue and green with scripts or GitHub Actions

Add Route 53 failover routing

Integrate GitHub Actions for CI/CD with Terraform

Add health checks for dynamic failover

👨‍💻 About Me
Oladapo Adenekan
Aspiring Cloud & DevOps Engineer
📧 Email: adenekanoladapo302@gmail.com
🔗 GitHub: @oladapoade
🔗 LinkedIn: linkedin.com/in/oladapo568

yaml
Copy
Edit

---

### ✅ What to Do Next

1. **Go to your GitHub repo**
2. Click `README.md` → ✏️ **Edit**
3. **Paste this content**
4. Click **Commit changes**

---

Let me know if you want:
- A CI/CD pipeline using GitHub Actions
- A PDF version for job applications
- Help optimizing this for recruiters

Let’s make it shine 🚀






You said:
i said put them together in one page to copy them all at once 
ChatGPT said:
Got it, Oladapo! Here's your entire README.md in one continuous block, fully formatted and ready to copy and paste all at once into your GitHub repository — no breaks, no interruptions, everything on one page.

markdown
Copy
Edit
# 🚀 AWS Blue-Green Deployment using Terraform and CI/CD Automation

## 📘 Project Overview

This project demonstrates how I implemented a **Blue-Green Deployment strategy on AWS** using **Terraform** for Infrastructure as Code (IaC). The goal is to ensure **zero-downtime deployments** by routing traffic between two identical environments (Blue and Green) using an **Application Load Balancer (ALB)**.

Each environment runs an EC2 instance configured with Apache web server, displaying distinct pages. Infrastructure is modularized using Terraform and verified via browser and SSH testing. Screenshots document every stage of the deployment process.

## 🧰 Tools & Technologies Used

- Terraform  
- AWS EC2, ALB, Security Groups, Subnets  
- Apache HTTP Server (Ubuntu)  
- Git & GitHub  
- Visual Studio Code  
- Canva (for architecture diagram)

## 📊 Architecture Diagram

![Architecture Diagram](images/Untitled%20design.png)

This architecture includes:
- Blue and Green EC2 environments
- Application Load Balancer (ALB)
- Target Groups and Security Groups
- Apache Web Servers installed via Terraform `user_data`
- Manual switching between blue and green targets in this setup

## 🔧 Step-by-Step Implementation

### ✅ Step 1: Terraform Initialization and Provider Setup

Defined the AWS provider and initialized the project using:

```hcl
provider "aws" {
  region = "us-east-1"
}
Command:

bash
Copy
Edit
terraform init
✅ Step 2: Preview Infrastructure Changes
Executed the plan to review resources before provisioning.

bash
Copy
Edit
terraform plan
Screenshot:

✅ Step 3: Configure Security Groups
Created security groups to allow:

Port 22 for SSH

Port 80 for HTTP

Screenshot:

✅ Step 4: Provision Blue & Green EC2 Instances
Deployed two EC2 instances using blue.tf and green.tf, each with:

Apache installed via user_data

Distinct HTML content to differentiate environments

Screenshot:

✅ Step 5: Configure the Application Load Balancer (ALB)
Used alb.tf to configure an ALB that forwards traffic to either the blue or green target group. Manual switching simulates blue-green deployment.

Screenshot:

✅ Step 6: Output and Verify EC2 Public IPs
Displayed instance IPs using outputs.tf, enabling SSH and browser testing.

hcl
Copy
Edit
output "blue_instance_ip" {
  value = aws_instance.blue.public_ip
}
Screenshot:

✅ Step 7: SSH Into EC2 to Confirm Apache Deployment
Used the key pair to SSH into the EC2 instance and confirm Apache was installed and serving the page.

Screenshot:

✅ Step 8: Validate Web Pages Through ALB
Tested the ALB DNS in a browser to verify:

Blue Environment Page:

Green Environment Page:

⚠️ Problems Faced & Solutions
❌ Problem 1: SSH Not Working
Cause: Port 22 not open in the security group
Fix: Added SSH rule and re-applied Terraform

❌ Problem 2: Public IP Not Showing
Cause: Missing output reference
Fix: Added public IP output block in outputs.tf

❌ Problem 3: Ping Failing to EC2
Cause: UFW firewall blocking ICMP
Fix: Disabled UFW temporarily to test and confirmed access

🎯 Key Takeaways
Built reusable, modular Terraform code

Demonstrated zero-downtime deployment using ALB

Automated Apache installation using user_data

Successfully routed traffic between environments

Documented entire process with real screenshots

🚀 Future Improvements
Automate switching between blue and green with scripts or GitHub Actions

Add Route 53 failover routing

Integrate GitHub Actions for CI/CD with Terraform

Add health checks for dynamic failover

👨‍💻 About Me
Oladapo Adenekan
Enthusiastic Cloud & DevOps Engineer
📧 Email: adenekanoladapo302@gmail.com
🔗 GitHub: @oladapoade
🔗 LinkedIn: linkedin.com/in/oladapo568
