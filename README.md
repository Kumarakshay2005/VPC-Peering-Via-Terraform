# 🌐 VPC Peering via Terraform (AWS)

This repository demonstrates how to create **VPC Peering between two AWS VPCs using Terraform**, following Infrastructure as Code (IaC) best practices.

The setup uses **multiple AWS providers** to provision resources in **different AWS regions**, making it a practical reference for real-world multi-region architectures.

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

If you found this useful, feel free to ⭐ the repo and connect with me on LinkedIn!

Happy Terraforming 🚀
