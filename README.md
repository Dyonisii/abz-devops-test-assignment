# WordPress AWS Infrastructure

## 🌟 Key Features
- Terraform-managed AWS infrastructure (VPC, EC2, RDS, Redis)
- Dockerized WordPress & Nginx
- Auto-configured security groups

## 🛠️ Configuration

### Terraform Variables (`terraform/variables.tf`)
```hcl
variable "db_password" {
  description = "RDS MySQL password" # Set via TF_VAR_db_password
  sensitive   = true
}

## 🛠️ Quick Deployment Guide

1. Clone Repository
git clone https://github.com/Dyonisii/abz-devops-test-assignment && cd repo

2. Configure Environment
 export = "XXXXXXXXXXXX"
 export = "XXXXXXXXXXXXXXXXXXXXXXx"
# Required variables
export db_password="your_secure_password_here" 

3. Deploy Infrastructure
cd terraform && terraform apply

🚨 Troubleshooting
Common Issues
Issue	Solution
RDS fails to create	Check AWS quota for DB instances
WordPress 500 error	Verify RDS endpoint in wp-config.php
Nginx SSL errors	Ensure certs exist in nginx/config/ssl/



Project Structure:
.
├── README.md                  # Project documentation
├── env.example                # Example environment variables file
├── nginx/                     # Nginx configuration and Dockerfile
│   ├── Dockerfile
│   └── config/
│       ├── bots.d/
│       ├── conf.d/
│       ├── deny.d/
│       ├── headers.d/
│       ├── nginx.conf
│       └── ssl/
├── terraform/                 # Infrastructure as Code (IaC) with Terraform
│   ├── main.tf
│   ├── modules/
│   │   ├── ec2/
│   │   ├── rds/
│   │   ├── redis/
│   │   ├── security_groups/
│   │   └── vpc/
│   ├── output.tf
│   ├── provider.tf
│   └── variables.tf
└── wordpress/                 # WordPress setup with Docker
    ├── Dockerfile
    ├── app/
    │   ├── index.php
    │   ├── license.txt
    │   ├── readme.html
    │   ├── wp-*.php and core WP directories
    ├── docker-entrypoint.sh
    └── wp-config-docker.php

