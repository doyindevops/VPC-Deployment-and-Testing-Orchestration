### Project Overview

Hello and welcome to my **Terraform Infrastructure Provisioning with Security Scanning** project! This journey began with my desire to merge my passion for cloud infrastructure, automation, and security into a single, comprehensive project. Throughout this experience, I explored how to efficiently use Terraform to automate the provisioning of a secure, scalable AWS infrastructure, integrated with Docker containers, and strengthened by continuous security scanning. Whether you're interested in Infrastructure as Code (IaC), DevSecOps, or building a robust cloud environment, I'm excited to share what I've learned and accomplished!

### My Journey and Key Features

As I developed this project, I focused on several key features that I believe are essential for modern cloud infrastructure:

- **Infrastructure as Code (IaC):** One of my primary goals was to utilize Terraform to automate the deployment of AWS resources like VPCs, EC2 instances, RDS databases, and Application Load Balancers. This approach not only makes infrastructure management more efficient but also ensures consistency and scalability across the environment.

- **Dockerized Services:** To create isolated and consistent environments, I deployed crucial services like Redis, MariaDB, and Prometheus using Docker containers. This experience taught me the value of containerization in maintaining clean, reproducible, and stage-appropriate environments throughout the deployment process.

- **Continuous Security Integration:** Security is a cornerstone of my work, so I integrated continuous security scanning into the CI/CD pipeline using tools like Snyk and Trivy. This step was vital in allowing me to detect and address vulnerabilities in Docker images early, ensuring a safer production environment.

### Architecture Overview

As I mapped out the architecture for this project, my focus was on creating a robust, secure, and scalable AWS infrastructure. Here’s how I approached it:

#### AWS Infrastructure

I carefully designed the AWS infrastructure to support a multi-tiered architecture, balancing security, scalability, and performance:

- **VPC Configuration:** I set up a Virtual Private Cloud (VPC) that segregates public-facing and internal resources using public and private subnets. This configuration minimizes the exposure of critical services to the public internet, enhancing security.

- **EC2 Instances:** I provisioned several EC2 instances, each with a specific role to ensure efficient operation and security:
  - **Docker Host:** Configured to run Docker containers that host Redis, MariaDB, and Prometheus.
  - **Frontend and Backend Servers:** Dedicated instances handle the application’s frontend and backend services.
  - **Jump Host and Bastion Host:** These instances were deployed to provide secure SSH access, adding an extra layer of security to the architecture.

- **RDS MySQL Database:** By deploying a highly available MySQL database within a private subnet using Amazon RDS, I ensured that the database remains secure and is not directly exposed to the internet.

- **Application Load Balancer (ALB):** To ensure high availability and fault tolerance, I deployed an ALB to distribute incoming traffic across multiple frontend instances.

#### Docker Containers

Deploying Docker containers was a critical part of my project, allowing me to encapsulate essential services within the Docker host instance:

- **Redis:** I deployed Redis as an in-memory data structure store, crucial for caching and message brokering within the infrastructure.
- **MariaDB:** By deploying MariaDB in a Docker container, I ensured data persistence and high performance for the relational database needs of the project.
- **Prometheus:** I integrated Prometheus as an open-source monitoring and alerting toolkit to keep a close watch on the health of the infrastructure and applications.

### Security Integration

A key learning from this project was the importance of integrating security into every phase of development. By embedding continuous security scanning within the CI/CD pipeline, I ensured that potential vulnerabilities were detected and resolved before deployment:

- **Snyk:** I used Snyk to scan Docker images for known vulnerabilities, focusing on critical issues and providing actionable insights for remediation.
- **Trivy:** Trivy added another layer of security by scanning Docker images for vulnerabilities, helping me to ensure that production images were free from critical flaws.

### GitHub Actions Workflow

To automate the deployment and security scanning process, I implemented a GitHub Actions workflow divided into two main jobs:

1. **Terraform Plan and Apply:**
   - Initializes and applies Terraform configurations to set up the AWS infrastructure.
   - Outputs essential details like instance IDs, load balancer DNS, and RDS endpoints for reference.

2. **Build, Start Services, and Security Scan:**
   - Builds Docker images and deploys services using Docker Compose.
   - Performs security scans on the Docker images using Snyk and Trivy, generating detailed reports.
   - Uploads the scan results as artifacts for further analysis and remediation.

### Visual Insights

To help you visualize the architecture and the outcomes of the security scans, I've included several screenshots in the **IMAGES** directory within this repository. Here’s a snapshot:

- **Snyk Scan Report Summary:** This report provides an in-depth analysis of the Docker image `myapp:latest`. It highlights several critical vulnerabilities introduced through the base image `node:14`, such as integer overflow vulnerabilities and XML External Entity (XXE) injection risks.

  - **Critical Vulnerabilities Found:** 7
  - **Recommendations:** Upgrade to `node:22.5.0-bookworm-slim` to mitigate these vulnerabilities and ensure a more secure environment.

### Conclusion

This project represents my journey in automating infrastructure provisioning and integrating security into the DevOps pipeline. By leveraging Terraform, Docker, and continuous security scanning tools, I’ve built an infrastructure that is both scalable and secure. I hope my journey and this project inspire you to explore the exciting intersection of cloud infrastructure, automation, and security!

**Project Created by Adedoyin Ekong - DevSecOps Enthusiast**
