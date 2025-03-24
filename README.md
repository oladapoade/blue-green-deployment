
# 🚀 AWS Blue-Green Deployment with Terraform & CI/CD Automation

This project demonstrates a **Blue-Green Deployment strategy on AWS** using **Terraform** for Infrastructure as Code (IaC), and **CI/CD Automation** to handle seamless, zero-downtime deployments. The deployment leverages EC2 instances behind an Application Load Balancer (ALB), allowing easy switching between blue and green environments for staging and production.

## Tools and Technologies Used

- Terraform  
- AWS EC2  
- AWS ALB (Application Load Balancer)  
- CI/CD with GitHub Actions  
- Apache Web Server  
- SSH & Security Groups  
- Ubuntu Linux  
- Visual Studio Code  
- Canva (for architecture diagram)

## Architecture Diagram

![Architecture Diagram](Untitled%20design.png)

This diagram shows the infrastructure layout, which includes two sets of EC2 instances (blue and green environments), an ALB to switch between them, security groups, and networking components.

## Folder Structure


## Implementation Steps

I began by configuring the AWS provider in the `provider.tf` file, defining the region and backend configuration. I then used multiple `.tf` files to keep the infrastructure modular and clean—`main.tf`, `alb.tf`, `blue.tf`, `green.tf`, etc.

I created the networking setup, security groups for SSH (port 22) and HTTP (port 80), and then provisioned two EC2 instances for the blue and green environments. Each EC2 instance had a startup script to install Apache and display a distinct webpage for identification.

After the compute resources were deployed, I configured an Application Load Balancer to route traffic between the environments. The ALB target groups were defined to switch between blue and green deployments without downtime.

I outputted key information such as public IPs and key pair names for testing SSH and browser-based validation.

### Screenshots of Implementation

**Terraform Plan Output:**  
![Terraform Plan Output](terraform-plan-output-part1.png)  
![Terraform Plan Output](terraform-plan-output-part2.png)  
![Terraform Plan Output](terraform-plan-output-part3.png)  
![Terraform Plan Output](terraform-plan-output-part4.png)  
![Terraform Plan Output](terraform-plan-output-part5.png)  
![Terraform Plan Output](terraform-plan-output-part6.png)  
![Terraform Plan Output](terraform-plan-output-part7.png)  
![Terraform Plan Output](terraform-plan-output-part8.png)  
![Terraform Plan Output](terraform-plan-output-part9.png)

**Security Group SSH Rule:**  
![Security Group Rule](security-group-ssh-rule-added.png)

**SSH Access to Blue EC2 Instance:**  
![Blue EC2 SSH](blue-instance-ssh-login.png)

**EC2 Instances Running (Before Switching):**  
![EC2 Instances](ec2-blue-green-before-termination.png)

**Apache Setup on Instance:**  
![Apache Setup](instance-apache-setup.png)

**ALB Output After Terraform Apply:**  
![ALB Output](terraform-apply-output-with-alb.png)

**Public IP Output:**  
![Public IP](ec2-instances-public-ip.png)

**Key Output:**  
![Key Output](terraform-apply-with-key-output.png)

**Reapply Public Subnet Output:**  
![Subnet Output](terraform-reapply-public-subnet.png)

**Blue Page Test via ALB:**  
![Blue Page](alb-blue-page-test.png)

**Green Page Test via ALB:**  
![Green Page](alb-green-page-test.png)

## Problems Faced & Solutions

**Problem 1:** Could not SSH into the EC2 instance.  
**Solution:** I realized I forgot to add port 22 to the inbound rules of the security group. After updating the rule and reapplying Terraform, I was able to SSH successfully.  

**Problem 2:** Ping to EC2 instance’s public IP was failing.  
**Solution:** The default firewall on the Ubuntu EC2 instance (UFW) was active. I disabled it for testing and also confirmed that ICMP was allowed in the security group if needed.  

**Problem 3:** Terraform output didn’t show EC2 public IPs.  
**Solution:** I fixed this by adding correct resource references in the `outputs.tf` file:

```hcl
output "blue_instance_ip" {
  value = aws_instance.blue.public_ip
}


Key Takeaways
Successfully implemented zero-downtime deployments using the Blue-Green model.

Practiced modular and reusable Terraform code for AWS infrastructure.

Set up and tested secure EC2 access, Apache deployment, and traffic routing via ALB.

Troubleshot real-world cloud and networking issues and solved them efficiently.

Created visual documentation using Canva and took real implementation screenshots.

Next Steps
Add GitHub Actions pipeline to automate blue-green switching.

Implement health checks for auto-routing based on instance health.

Use Route 53 for domain-level traffic failover.

Expand architecture with database tier and monitoring.

About Me
Oladapo Adenekan
Aspiring Cloud & DevOps Engineer
📧 Email: adenekanoladapo302@gmail.com
🔗 GitHub: @oladapoade
🔗 LinkedIn: linkedin.com/in/oladapo568
