# 🌐 VPC Peering via Terraform (AWS)

![Terraform](https://img.shields.io/badge/Terraform-IaC-623CE4?logo=terraform)
![AWS](https://img.shields.io/badge/AWS-Cloud-FF9900?logo=amazonaws)
![Status](https://img.shields.io/badge/Status-Active-success)
![License](https://img.shields.io/badge/License-MIT-blue)

This repository demonstrates how to create **VPC Peering between two AWS VPCs using Terraform**, following Infrastructure as Code (IaC) best practices.

The setup uses **multiple AWS providers** to provision resources in **different AWS regions**, making it a practical reference for real-world multi-region architectures.

---

## 🖼 Architecture Overview

```
+----------------------+           VPC Peering            +----------------------+
|  Primary VPC         | <------------------------------> |  Secondary VPC       |
|  (ap-south-1)        |                                  |  (eu-central-1)      |
|                      |                                  |                      |
|  EC2 Instance        |                                  |  EC2 Instance        |
|  Private/Public Subnet|                                  |  Private/Public Subnet|
+----------+-----------+                                  +-----------+----------+
           |                                                                  |
           |---------------- Internet Gateway -------------------------------|
```

---

## 🚀 Features

* ✅ Create **Primary and Secondary VPCs** in different AWS regions
* 🔗 Establish **VPC Peering Connection** using Terraform
* 🛣 Configure **Route Tables** for inter-VPC communication
* 🔐 Define **Security Groups** with dynamic ingress and egress rules
* 🖥 Launch **EC2 instances** in both VPCs
* ⚙️ Use **multiple AWS providers (alias-based)**
* 📦 Clean, modular, and reusable Terraform configuration

---

## 🛠 Tech Stack

* **Terraform** (v1.x)
* **AWS Provider** (~> 5.0)
* **Amazon VPC**
* **EC2**
* **Route Tables & Internet Gateway**
* **Security Groups**

---

## 📁 Project Structure

```
Project2/
├── provider.tf
├── vpc.tf
├── subnet.tf
├── igw.tf
├── routetable.tf
├── vpcpeering.tf
├── sg.tf
├── ec2.tf
├── data.tf
├── variables.tf
└── outputs.tf
```

---

## ⚙️ Prerequisites

* AWS Account
* Terraform installed
* AWS CLI configured
* Valid EC2 Key Pairs in both regions

---

## ▶️ How to Use

```bash
terraform init
terraform validate
terraform plan
terraform apply
```

To destroy resources:

```bash
terraform destroy
```

---

## 🧠 Learning Outcomes

* Understand **multi-region AWS deployments**
* Learn **provider aliasing** in Terraform
* Implement **secure VPC peering**
* Write **scalable and clean IaC**

---

## 🔗 Repository

👉 GitHub: [https://github.com/Kumarakshay2005/VPC-Peering-Via-Terraform](https://github.com/Kumarakshay2005/VPC-Peering-Via-Terraform)

---

## 🙌 Author

**Akshay Kumar**
Cloud & DevOps Engineer

This project is actively maintained and continuously improved to help the DevOps community learn, build, and scale cloud infrastructure.

Happy Terraforming 🚀
