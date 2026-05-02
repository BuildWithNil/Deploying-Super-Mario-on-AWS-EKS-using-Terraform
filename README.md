# 🚀 Deploying Super Mario on AWS EKS using Terraform

Bring a classic to the cloud. This project demonstrates how to deploy the iconic **Super Mario** game on **Amazon EKS (Elastic Kubernetes Service)** using **Terraform** for infrastructure provisioning and Kubernetes manifests for application deployment.

![Super Mario](https://imgur.com/Njqsei9.gif)

---

## 📌 Project Overview

This project provisions a production-ready **EKS cluster** on AWS and deploys the **Super Mario application** with modern DevOps best practices.

### ✔️ Key Capabilities
- Amazon EKS Cluster (v1.29)
- Terraform (v1.8+) Infrastructure as Code
- Kubernetes Deployment & Service
- Remote state management using AWS S3
- IAM roles & policies with least-privilege access
- CloudWatch logging & monitoring
- Horizontal Pod Autoscaling (HPA)
- Network policies for enhanced security
- Prometheus integration via ServiceMonitor
- AWS Load Balancer Controller support
- Health checks and rolling updates

---

## 📁 Project Structure

```bash
📂 DEPLOYMENT-OF-SUPER-MARIO
│── 📂 EKS-TF
│   ├── backend.tf
│   ├── main.tf
│   ├── provider.tf
│   ├── variables.tf
│   ├── outputs.tf
│   ├── terraform.tfvars.example
│   ├── deployment.yaml
│   ├── service.yaml
│   ├── horizontal-pod-autoscaler.yaml
│   ├── network-policy.yaml
│   └── service-monitor.yaml
│── 📄 README.md
```

---

## 📌 Prerequisites

Ensure the following tools are installed and configured:

- Terraform (>= 1.8.0)
- AWS CLI (with credentials configured)
- kubectl
- Docker
- AWS Key Pair named `eks-key`

---

## 🛠️ Setup & Deployment

### 1️⃣ Clone Repository

```bash
git clone https://github.com/BuildWithNil/Deploying-Super-Mario-on-AWS-EKS-using-Terraform.git
cd Deploying-Super-Mario-on-AWS-EKS-using-Terraform/EKS-TF
```

### 2️⃣ Configure Variables

```bash
cp terraform.tfvars.example terraform.tfvars
```

Update values as needed.

#### 💡 Cost Optimization Tips
- Use `t3.small` for lower cost
- Set `desired_size = 1`, `max_size = 2` for dev
- Reduce `disk_size` to 20GB if needed
- Lower log retention (3–7 days)

---

### 3️⃣ Initialize & Deploy

```bash
terraform init
terraform plan
terraform apply -auto-approve
```

---

### 4️⃣ Configure Kubernetes

```bash
aws eks update-kubeconfig --name EKS_CLOUD --region ap-south-1
```

---

### 5️⃣ Deploy Application

```bash
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
kubectl apply -f horizontal-pod-autoscaler.yaml
kubectl apply -f network-policy.yaml
kubectl apply -f service-monitor.yaml   # Optional
```

---

### 6️⃣ Access Application

```bash
kubectl get services mario-service
```

Use the LoadBalancer URL in your browser.

---

### 7️⃣ Monitor Deployment

```bash
kubectl get deployment mario-deployment
kubectl get pods -l app=mario
kubectl get hpa mario-hpa
kubectl logs -l app=mario --tail=50
kubectl describe hpa mario-hpa
```

---

## 🎯 Project Highlights

- Modern Kubernetes on AWS EKS v1.29
- Infrastructure automation using Terraform
- Secure IAM and networking practices
- Scalable architecture with HPA
- Observability with CloudWatch & Prometheus
- Production-ready deployment design

---

## ⚙️ Configuration Summary

### EKS Cluster
- Version: 1.29
- Instance Type: t3.medium
- Scaling: 1–4 nodes
- Logging enabled
- Public & private endpoint access

### Kubernetes
- 3 replicas (auto-scale to 10)
- CPU: 100m–500m
- Memory: 128Mi–512Mi
- Liveness & readiness probes

### Monitoring
- CloudWatch logs (14 days)
- Prometheus-ready
- HPA (CPU & Memory based)

---

## 🔗 Documentation

- Terraform: https://developer.hashicorp.com/terraform/docs
- AWS EKS: https://docs.aws.amazon.com/eks/latest/userguide
- Kubernetes: https://kubernetes.io/docs/home/
- AWS Load Balancer Controller: https://kubernetes-sigs.github.io/aws-load-balancer-controller/
- Prometheus: https://prometheus.io/docs/

---

## 📢 Acknowledgment

Inspired by the timeless **Super Mario** game, this project showcases real-world DevOps implementation using AWS, Terraform, and Kubernetes.

---

## 🤝 Contributing

Contributions are welcome. Feel free to fork the repo and submit a pull request.

---

## ⭐ Support

If you find this project useful, consider giving it a star.

---

## 👨‍💻 Author

**Nilamadhab Das**  
GitHub: https://github.com/BuildWithNil  
LinkedIn: https://linkedin.com/in/buildwithnil

---

🚀 Happy Learning & Building!
