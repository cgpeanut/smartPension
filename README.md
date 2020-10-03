# Setup notes
# smartPension Interview Tasks
# README.pdf for more detailed Step by Step with graphics.

```
Section #1: Setup Notes for a terrafrom persistent backend with a control node. requirement 3 

1. please create a Amazon Linux 2 VM as your Terraform control node. 

2. Configure your Amazon Linuz 22 VM Terraform control node VM by executing the following commands.

	# sudo yum -y install epel-release
	# sudo yum -y install wget unzip vim git -y
	# git --version
	# wget https://releases.hashicorp.com/terraform/0.12.29/terraform_0.12.29_linux_amd64.zip
	# unzip terraform_0.12.29_linux_amd64.zip
        # sudo mv terraform /usr/local/bin/
	# terraform --version

	# sudo yum -y install python3-pip
	# pip3 install awscli --user 
	# pip3 install ansible --user 
	
3. Download smartPension Terraform/Ansible source code from cgpeanut/smartPension repo:
	
	# cd $HOME
	# mkdir code
	# git clone https://github.com/cgpeanut/smartPension.git
	# cd smartPension
	# cat ansible.cfg
	# aws --version 
	# ansible --version

4. Configure your AWS CLI using with your free account credentials, refer to the READ.pdf file for more details.

5. Create a Persisting Terraform State in S3 backend using AWS CLI (requirement #3).
	
	# cd $HOME/code/smartPension
	# aws configure (input your credentials)
	# aws s3api create-bucket --bucket smartpensionpersistantbucket1005

6. Place the "smartpensionpersistantbucket1005" in your backend.tf file (detailed instructions -> README.pdf)

terraform {
  required_version = ">=0.12.0"
  required_providers {
    aws = ">=3.0.0"
  }
  backend "s3" {
    region  = "us-east-1"
    profile = "default"
    key     = "terraformstatefile"
    bucket  = "smartpensionpersistantbucket1005"
  }
}

Section #2: Setup Notes for Load Balancer and HTTP. requirements 1 & 2

1. Please run the playbook "gen_ssh_key.yaml" , "ansible-playbook ansible_templates/gen_ssh_key.yaml"
   to generate SSH keypair(on local system) used in TF templates and Ansible for connecting to
   remote EC2 instances.

2. If you still want to initialize directory via "terraform init", then use the "-backend=false" flag,
   like so "terraform init -backend=false"
