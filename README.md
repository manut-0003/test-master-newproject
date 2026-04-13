
# AWS DevOps Terraform Solution

## Architecture

                Internet
                    |
               CloudFront
                    |
                    S3 (React App)
                    |
                Application
                Load Balancer
                 /       \
            ECS Fargate  ECS Fargate
                 |           |
                 --------Redis-------
                      Multi-AZ

## Components

| Component | Service |
|----------|--------|
| Frontend | S3 + CloudFront |
| API | ECS Fargate |
| Container Registry | ECR |
| Database | ElastiCache Redis |
| Networking | VPC + NAT + IGW |
| CDN | CloudFront |

## Prerequisites

- AWS CLI
- Terraform >= 1.5
- Docker
- Node.js + npm

## Deployment

### 1 Terraform

terraform init
terraform plan
terraform apply

### 2 Build and push API

./deploy.sh api

### 3 Deploy frontend

./deploy.sh frontend

## Improvements

1. HTTPS custom domain with ACM
2. CI/CD pipeline (GitHub Actions)
3. ECS auto scaling
4. Redis AUTH
5. Multi NAT Gateway
6. AWS WAF
7. Remote Terraform state
8. Monitoring with Prometheus
9. Secrets Manager
10. Blue/Green deployments
