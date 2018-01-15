# hashicorp-workshop
Exercises for hashicorp-workshop

### Steps

#### Create IAM user
1. Create a user with name "usr_consul" with Programmatic access & in Admin group
2. Save "Access key ID" & "Secret access key" somewhere

#### Build AMI using Packer
[Read Here](packer/README.md)
   
#### Use Terraform to provision EC2 instances
[Read Here](terraform/README.md)

[Testing for Terraform](terraform/tests/README.md)

#### Destroy all instances/AMI 
1. Go to terraform/consul directory
2. `terraform plan -destroy -var-file="../terraform.tfvars" -var "ami=${ami_id}"`
3. `terraform destroy -var-file="../terraform.tfvars" -var "ami=${ami_id}"`

4. Go to terraform/nginx directory
5. `terraform plan -destroy -var-file="../terraform.tfvars" -var "ami=${ami_id}"`
6. `terraform destroy -var-file="../terraform.tfvars" -var "ami=${ami_id}"`

7. `aws ec2 deregister-image --image-id ${ami_id}`

8. Go to terraform/vpc directory
9. `terraform plan -destroy`
10. `terraform destroy`