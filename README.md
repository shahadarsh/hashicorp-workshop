# HashiCorp Workshop
Exercises for Hashicorp Workshop

### Prerequisites

#### Create AWS account
All exercises require an AWS account so create an account if you don't have it 

#### Create IAM user
1. Go to your AWS console & create IAM user by following instructions [here](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_users_create.html)
2. Create a user with name "usr_hashicorp" with Programmatic access & in Admin group
2. Save "Access key ID" & "Secret access key" somewhere locally

#### Install AWS CLI 
Install AWS CLI following instructions [here](https://docs.aws.amazon.com/cli/latest/userguide/installing.html)

### Workshop Steps

#### Configure AWS CLI with a profile 
Configure AWS CLI by typing `aws configure` in your terminal & following the instructions
This profile will be used for access_key, secret_key etc.

#### Build AMI using Packer
[Read Here](packer/README.md)
   
#### Use Terraform to provision EC2 instances
[Read Here](terraform/README.md)

[Testing for Terraform](terraform/tests/README.md)

#### Destroy all instances/AMI 
4. Go to terraform/nginx directory
5. `terraform plan -destroy -var-file="../terraform.tfvars" -var "ami=${ami_id}"`
6. `terraform destroy -var-file="../terraform.tfvars" -var "ami=${ami_id}"`

7. `aws ec2 deregister-image --image-id ${ami_id}`

8. Go to terraform/vpc directory
9. `terraform plan -destroy`
10. `terraform destroy`