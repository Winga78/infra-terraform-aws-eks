# infra-terraform-aws-eks

## Description  
Ce projet utilise Terraform pour provisionner sur AWS une infrastructure Kubernetes via Amazon EKS, avec réseau, sous-réseaux, VPC, sécurité, nœuds, load-balancer, etc.  
L’objectif est d’obtenir un cluster Kubernetes prêt à l’emploi pour y déployer des applications, gérer des workloads, et offrir une base scalable et modulaire.

## Composants déployés  
- VPC + subnets publics / privés pour isoler le cluster.  
- Security groups / règles réseau pour sécuriser l’accès.  
- EKS cluster (control plane) + groupes de nœuds (workers / EC2).  
- (Optionnel selon configuration) Load balancer / service de type “LoadBalancer” pour exposer des services externes.  
- Variables Terraform configurables pour adapter l’infra (region, nombre de nœuds, types d’instances, CIDR, etc.)

## Structure du repo
/ ── main.tf # configuration principale, provider, backend, modules éventuels, data sources <br>
├── vpc.tf # définition du VPC, subnets, routing <br>
├── subnets.tf # sous-réseaux / configuration réseau <br>
├── security.tf # security groups / IAM / règles de sécurité <br>
├── eks.tf # création du cluster EKS, rôle, settings cluster <br>
├── ec2.tf # définition des nœuds workers / EC2  <br>
├── lb.tf # load-balancer / service d’exposition <br>
├── variables.tf # variables d’entrée du module / stack <br>
└── .gitignore # fichiers à ignorer (credentials, state local, etc.) <br>



## Prérequis  
- Terraform (version compatible avec les providers AWS / EKS utilisés)  
- Un compte AWS avec les permissions nécessaires (VPC, EKS, EC2, IAM, Load Balancer...)  
- Variables AWS configurées (via `aws credentials`, variables d’environnement ou provider Terraform)  
- Si tu utilises des modules externes : s’assurer de la compatibilité des versions (provider, modules Terraform) — comme recommandé dans les “best practices” Terraform. :contentReference[oaicite:2]{index=2}

## Déploiement / Utilisation  

```bash
terraform init
terraform plan
terraform apply


