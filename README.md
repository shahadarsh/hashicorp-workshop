# hashicorp-workshop
Exercises for hashicorp-workshop

### Steps

#### Create IAM user
1. Create a user with name "usr_consul" with Programmatic access & in Admin group
2. Save "Access key ID" & "Secret access key" somewhere

#### Create AMI using Packer
1. Edit packer_vars.json with aws access & secret keys. Make sure you don't commit that file.
2. Go to nginx directory
3. packer validate nginx.json
4. packer build -var-file=../packer_vars.json nginx.json
   
#### Provision EC2 instance using AMI
1. Create Key key_hashicorp
2. chmod 400 key_hashicorp.pem
2. Edit terraform.tfvars with aws access, secret keys & key path. Make sure you don't commit that file.
3. Go to terraform/nginx directory
4. terraform init
5. terraform plan \
   -var-file="./terraform.tfvars" \
   -var 'ami=ami_created_above' 
6. terraform apply \
   -var-file="./terraform.tfvars" \
   -var 'ami=ami_created_above'
7. Browse to Public DNS for each instance to see nginx welcome page

#### Setup Consul using Terraform
1. Go to terraform/consul directory
2. terraform init
3. terraform plan \
      -var-file="./terraform.tfvars"
4. terraform apply \
      -var-file="./terraform.tfvars"
5. Verify UI comes up http://${public_dns}:8500/

#### Try Key Value Store in Consul
1. curl http://${public_dns}:8500/v1/agent/members
2. curl \
       --request PUT \
       --data 'awesome' \
       http://${public_dns}:8500/v1/kv/wrkshop_fb

#### Try Service Discovery in Consul
1. Go to payload directory
2. curl \
       --request PUT \
       --data @register_service.json \
       http://${public_dns}:8500/v1/agent/service/register

#### Destroy all instances/AMI 
1. Go to terraform/consul directory
2. terraform plan -destroy -var-file="../terraform.tfvars" -var "ami=${ami_id}"
3. terraform destroy -var-file="../terraform.tfvars" -var "ami=${ami_id}"

4. Go to terraform/nginx directory
5. terraform plan -destroy -var-file="../terraform.tfvars" -var "ami=${ami_id}"
6. terraform destroy -var-file="../terraform.tfvars" -var "ami=${ami_id}"

7. aws ec2 deregister-image --image-id ${ami_id}