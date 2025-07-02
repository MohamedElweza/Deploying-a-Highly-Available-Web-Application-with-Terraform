# 🚀 Highly Available Web Application on AWS using Terraform

This project demonstrates how to deploy a **highly available web application** on **AWS** using **Terraform**, with full infrastructure automation. It includes:

- Public and private subnets
- An Application Load Balancer (ALB)
- An Auto Scaling Group (ASG) for dynamic instance scaling
- A Bastion host for secure SSH access
- A NAT Gateway for private instances’ internet access
- Integration with **Amazon S3** for backups
- Proper IAM roles and security group configurations

---

## 🧭 Architecture Overview

![1728541888210-ezgif com-crop (1)](https://github.com/user-attachments/assets/1f915003-7214-4acf-974f-d4eeb581c017)

> The above diagram illustrates the setup including VPC, subnets, ALB, ASG, Bastion Host, NAT Gateway, S3, and IAM roles.

---

## 📁 Project Structure

```

terraform/
├── variables.tf
├── vpc.tf
├── security_groups.tf
├── alb.tf
├── autoscaling.tf
├── bastion.tf
├── iam_role.tf
├── s3.tf
├── natwy.tf
├── igw.tf
├── providers.tf
├── routing_tables.tf
├── subnets.tf
└──  terraform.tfvars

````

Each file is modularized for clarity and reusability.

---

## 🔧 Components

### ✅ 1. **AWS Provider**
- Region: `us-east-1`

---

### ✅ 2. **Networking**
- **VPC CIDR**: `192.168.0.0/16`
- **Subnets**:  
  - 2 Public Subnets (ALB, Bastion)
  - 2 Private Subnets (Application instances)
- **Internet Gateway**: For public internet access.
- **NAT Gateway**: For internet access from private subnets.

---

### ✅ 3. **Security Groups**
- **ALB & EC2**: Allow HTTP (port 80), SSH (port 22)
- **Bastion Host**: Restrict SSH to admin IP range

---

### ✅ 4. **Application Load Balancer**
- Listens on port 80
- Routes traffic to private EC2s via Target Group
- Health checks on `/`

---

### ✅ 5. **Auto Scaling Group (ASG)**
- **Min size**: 1  
- **Max size**: 3  
- **AMI**: Amazon Linux 2  
- **Launch Configuration**: Installs Python and starts a simple HTTP server with `Hello, World`

---

### ✅ 6. **Bastion Host**
- Deployed in a public subnet
- Accesses private instances via SSH using user-uploaded keys

---

### ✅ 7. **IAM & S3 Integration**
- EC2 IAM role allows read/write access to `Cloudkode-s3` bucket
- Backup and file storage functionality included

---

## 📦 Deployment Instructions

### 1. Clone the Repo

```bash
git clone https://github.com/your-username/terraform-ha-webapp.git
cd terraform-ha-webapp
````

### 2. Initialize Terraform

```bash
terraform init
```

### 3. Review the Execution Plan

```bash
terraform plan
```

### 4. Apply the Configuration

```bash
terraform apply
```

### 5. SSH into Bastion Host

```bash
ssh -i your-key.pem ec2-user@<bastion_public_ip>
```

Then from bastion:

```bash
ssh ec2-user@<private_instance_ip>
```

---

## 🧼 Cleanup

To destroy all resources:

```bash
terraform destroy
```

---

## 📚 Features Summary

| Feature               | Description                                                          |
| --------------------- | -------------------------------------------------------------------- |
| **High Availability** | Auto Scaling Group with Load Balancer distributes and scales traffic |
| **Secure Access**     | Bastion host manages secure SSH to private EC2s                      |
| **Internet Access**   | NAT Gateway allows secure outbound traffic from private instances    |
| **Automation**        | Full infrastructure as code using Terraform                          |
| **Backup Support**    | S3 integration for EC2 backup and storage tasks                      |

---

## 🙋‍♂️ Author

**Mohamed Elweza**
Connect with me on [LinkedIn]([https://www.linkedin.com/in/MohamedElweza](https://www.linkedin.com/in/mohamed-elweza/))

