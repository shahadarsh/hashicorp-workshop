# Build AMI using Packer

#### Exercise: 

Use info below to create an NGINX AMI using Packer:

AMI ID: ami-d651b8ac
Region: us-east-1
AMI Name: nginx-server -$your_user_name - {{timestamp}}

#### Steps to follow: 
1. Edit packer_vars.json with aws access & secret keys. Make sure you don't commit that file.
2. Go to nginx directory
3. packer validate nginx.json
4. packer build -var-file=../packer_vars.json nginx.json
