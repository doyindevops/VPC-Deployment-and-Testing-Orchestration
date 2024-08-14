Sure! Here’s an enhanced and robust version of your README that will captivate the reader’s attention. It includes mentions of where the images are stored within the repository for easy reference.

---

# Terraform Infrastructure Provisioning with Security Scanning

## Project Overview

Welcome to the **Terraform Infrastructure Provisioning with Security Scanning** project. This repository showcases how to efficiently use Terraform to automate the provisioning of a secure, scalable AWS infrastructure, integrated with Docker containers, and fortified by continuous security scanning. Whether you're interested in Infrastructure as Code (IaC), DevSecOps, or simply building a robust and secure cloud environment, this project has something valuable to offer.

## Key Features

- **Infrastructure as Code (IaC)**: Utilizes Terraform to automate the deployment of AWS resources such as VPC, EC2 instances, RDS databases, and Application Load Balancers.
- **Dockerized Services**: Deploys essential services like Redis, MariaDB, and Prometheus using Docker containers, ensuring isolated and consistent environments across different stages of deployment.
- **Continuous Security Integration**: Security scanning is seamlessly integrated into the CI/CD pipeline using tools like Snyk and Trivy, allowing early detection and remediation of vulnerabilities in Docker images.

## Architecture Overview

### AWS Infrastructure

The AWS infrastructure is meticulously crafted to support a multi-tiered architecture, balancing security, scalability, and performance:

- **VPC Configuration**: The project creates a Virtual Private Cloud (VPC) that segregates public-facing and internal resources using public and private subnets. This enhances security by limiting exposure of critical services to the public internet.
  
- **EC2 Instances**: Multiple EC2 instances are provisioned, each serving a specific role:
  - **Docker Host**: This instance is configured to run Docker containers that host Redis, MariaDB, and Prometheus.
  - **Frontend and Backend Servers**: Dedicated EC2 instances handle the frontend and backend services of the application.
  - **Jump Host and Bastion Host**: These instances are deployed for secure SSH access, adding an additional layer of security to the architecture.

- **RDS MySQL Database**: A highly available MySQL database is provisioned within a private subnet using Amazon RDS, ensuring that the database is not directly exposed to the internet.

- **Application Load Balancer (ALB)**: An ALB is deployed to distribute incoming traffic across multiple frontend instances, providing high availability and fault tolerance.

### Docker Containers

Within the Docker host instance, several critical services are deployed as containers:

- **Redis**: An in-memory data structure store used for caching and message brokering.
- **MariaDB**: A popular open-source relational database, deployed in a Docker container to ensure data persistence and high performance.
- **Prometheus**: An open-source monitoring and alerting toolkit, configured to keep an eye on the infrastructure and application health.

### Security Integration

Security is a cornerstone of this project. By integrating continuous security scanning into the CI/CD pipeline, we ensure that vulnerabilities are caught early and mitigated before they can cause damage.

- **Snyk**: Snyk is used to scan Docker images for known vulnerabilities, focusing on critical issues and providing actionable insights for remediating them.
- **Trivy**: Trivy adds an additional layer of security by scanning Docker images for vulnerabilities, ensuring the images used in production are free from critical flaws.

## GitHub Actions Workflow

To automate the deployment and security scanning process, this project leverages GitHub Actions. The workflow is divided into two main jobs:

1. **Terraform Plan and Apply**:
   - Initializes and applies Terraform configurations to set up the AWS infrastructure.
   - Outputs essential details like instance IDs, load balancer DNS, and RDS endpoints for reference.

2. **Build, Start Services, and Security Scan**:
   - Builds Docker images and deploys services using Docker Compose.
   - Performs security scans on the Docker images using Snyk and Trivy, generating detailed reports.
   - Uploads the scan results as artifacts for further analysis and remediation.

## Screenshots

Explore the architecture and results visually with the following screenshots, all located in the `IMAGES` directory within this repository:

- **Terraform Apply Output**: Shows the successful deployment of AWS resources.
  ![Terraform Apply](./IMAGES/terraform%20apply%201.jpg)

- **Running Instances**: A list of all EC2 instances running in the AWS environment.
  ![Running Instances](./IMAGES/running%20instances.jpg)

- **S3 Bucket**: Details of the S3 bucket used for storing Terraform state files.
  ![S3 Bucket](./IMAGES/S3.jpg)

- **RDS MySQL Database**: The RDS instance provisioned within the private subnet.
  ![RDS Instance](./IMAGES/RDS.jpg)

- **EC2 Instances**: Details of the EC2 instances running different components of the infrastructure.
  ![Instances](./IMAGES/Instances.jpg)

- **Load Balancer**: Configuration and status of the Application Load Balancer.
  ![Load Balancer](./IMAGES/loadbalancer.jpg)

- **Supplementary Views**: Additional details and configurations captured during the deployment process.
  ![Supplementary](./IMAGES/supplimentary.jpg)

## Snyk Scan Report Summary

The Snyk scan provided an in-depth analysis of the Docker image `myapp:latest`. Several critical vulnerabilities were detected, primarily introduced through the base image `node:14`. Issues identified included integer overflow vulnerabilities and XML External Entity (XXE) injection risks.

- **Critical Vulnerabilities Found**: 7
- **Recommendations**: Upgrade to `node:22.5.0-bookworm-slim` to mitigate these vulnerabilities and ensure a more secure environment.

## Conclusion

This project is a comprehensive automating infrastructure provisioning and integrating security into the DevOps pipeline. By leveraging Terraform, Docker, and continuous security scanning tools, it ensures that the deployed infrastructure is both scalable and secure.

---

### Created by Adedoyin Ekong - DevSecOps

---

