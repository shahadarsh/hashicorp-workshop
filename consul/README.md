# Setup Consul using Terraform

#### Exercise 

Use info below to provision Consul cluster using Terraform:

Region: us-east-1
Tag: consul-${count.index}
Instances: 3
Scripts: hashicorp-workshop/terraform/consul/scripts

#### Steps to follow:
1. Go to terraform/consul directory
2. terraform init
3. terraform plan \
      -var-file="../terraform.tfvars"
4. terraform apply \
      -var-file="../terraform.tfvars"
5. Verify UI comes up http://${public_dns}:8500/

#### Try Key Value Store in Consul
1. curl http://${public_dns}:8500/v1/agent/members
2. curl \
       --request PUT \
       --data 'value' \
       http://${public_dns}:8500/v1/kv/wrkshop_key
3. curl http://${public_dns}:8500/v1/kv/wrkshop_key

#### Try Service Discovery in Consul
1. Go to payload directory
2. curl \
       --request PUT \
       --data @register_service.json \
       http://${public_dns}:8500/v1/agent/service/register
       
3. dig @${public_dns} -p 8600 nginx-svc.service.consul SRV