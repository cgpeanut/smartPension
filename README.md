# Setup notes
# smartPension Interview Tasks
# Refer to README.pdf doc for more detailed Step by Step with graphics.

```
1. please create a Amazon Linux 2 VM as your control node. 

ID_LIKE="centos rhel fedora"
CPE_NAME="cpe:2.3:o:amazon:amazon_linux:2"

2. Step 2: Configure the Terraform control node VM by executing the following commands.

	• Install git version control, and other goodies. 
	
	# sudo yum -y install epel-release
	# sudo yum -y install wget unzip vim git -y

	• Validate the proper installation of git. If no error output is produced then,  git is properly installed.
	
	# git --version
