
# 🚀 AWS Blue-Green Deployment Project with Terraform and CI/CD Automation

This project demonstrates a full end-to-end Blue-Green deployment using **Terraform**, **AWS**, and **CI/CD automation (GitHub Actions or Jenkins)**. It simulates a production-ready infrastructure that allows safe application deployments with zero downtime, showcasing real-world DevOps and cloud engineering skills.

---

## 🛠️ Tools & Technologies Used

- **Terraform** – Infrastructure as Code
- **AWS EC2, ALB, Route53, Security Groups**
- **GitHub & GitHub Actions** – CI/CD
- **Amazon Linux 2**
- **VS Code + WSL Ubuntu**
- **Apache Web Server**
- **Canva** – For diagram design

---

## 📌 Project Architecture

![Architecture Diagram](screenshots/architecture-diagram.png)

---

## 📷 Screenshots (Real Setup + Results)

All screenshots show the live Terraform outputs, AWS console states, EC2 instance setup, Apache installations, SSH access, security group rules, and browser test validations.

**Terraform Planning & Apply Output**

![Plan Output 1](screenshots/terraform-plan-output-part1.png)
![Plan Output 2](screenshots/terraform-plan-output-part2.png)
![Plan Output 3](screenshots/terraform-plan-output-part3.png)
![Plan Output 4](screenshots/terraform-plan-output-part4.png)
![Plan Output 5](screenshots/terraform-plan-output-part5.png)
![Plan Output 6](screenshots/terraform-plan-output-part6.png)
![Plan Output 7](screenshots/terraform-plan-output-part7.png)
![Plan Output 8](screenshots/terraform-plan-output-part8.png)
![Plan Output 9](screenshots/terraform-plan-output-part9.png)
![Apply Output](screenshots/terraform-apply-output-with-alb.png)

**EC2 Instances & Security Groups**

![Instances Running](screenshots/ec2-instances-public-ip.png)
![Security Group Rules](screenshots/security-group-ssh-rule-added.png)
![Instances State](screenshots/ec2-blue-green-before-termination.png)

**SSH Login & Apache Install**

![SSH Login](screenshots/blue-instance-ssh-login.png)
![Apache Setup](screenshots/instance-apache-setup.png)

**Browser Tests (After Load Balancer Setup)**

![Blue Output](screenshots/alb-blue-page-test.png)
![Green Output](screenshots/alb-green-page-test.png)

---

## ⚠️ Problems Faced & Solutions

| Problem | Solution |
|--------|----------|
| GitHub pushing to wrong account | Removed cached credentials & re-authenticated with correct GitHub user |
| Terraform not displaying public IP | Added correct output values and ensured correct VPC/public subnet setup |
| EC2 instance unreachable | Modified security group to allow port 22 (SSH) and 80 (HTTP) |
| Browser showing 503 error | Ensured Apache was installed, started, and HTML file created |
| GitHub diagram not loading in README | Fixed by placing images in `/screenshots/` and linking relatively |

---

## 📚 Lessons Learned

- Mastered **Terraform deployment workflows**
- Understood **Blue-Green deployment best practices**
- Gained hands-on experience troubleshooting **AWS & SSH issues**
- Improved CI/CD understanding for **zero-downtime deployment**

---

## ✅ Final Result

- Successfully deployed two EC2 environments (Blue & Green)
- Live traffic routed through ALB after health checks
- Web server verified via browser showing "Hello from BLUE/GREEN Environment"

---

## 💡 What I’d Improve Next Time

- Automate rollback on health check failure
- Integrate with **GitHub Actions** or **Jenkinsfile** for full CI/CD pipeline
- Add Route53 DNS mapping

---

## 👨🏽‍💻 Author

**Oladapo Adenekan**  
[LinkedIn](https://www.linkedin.com/in/oladapo568)  
GitHub: [oladapoade](https://github.com/oladapoade)

---

