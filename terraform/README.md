# Use Terraform to provision EC2 instances

#### Exercise: 

Use info below to provision EC2 instance using Terraform:

AMI ID: nginx AMI you created above
Region: us-east-1
Instances: 3
Tag: "nginx-${count.index}"

#### Steps to follow:

1. Create Key key_hashicorp
2. `chmod 400 key_hashicorp.pem`
2. Edit terraform.tfvars with aws access, secret keys & key path. Make sure you don't commit that file.
3. Go to terraform/nginx directory
4. `terraform init`
5. `terraform plan \
   -var-file="../terraform.tfvars" \
   -var 'ami=ami_created_above'` 
6. `terraform apply \
   -var-file="../terraform.tfvars" \
   -var 'ami=ami_created_above'`
7. Browse to Public DNS of each instance to see nginx welcome page