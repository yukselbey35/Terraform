# Terraform
terraform version

terraform init

#Create an execution plan - means dry run
terraform plan

#Use -out flag to make an Output a deployment plan
terraform plan -out <plan-name>

#use -destroy flag to make a Output destroy plan
terraform plan -destroy

#apply all the configuration
terraform apply <plan-name>

#Only apply changes to a targeted resource
terraform apply -target=<resource-name>

#Pass a variable via the command line
terraform apply -var my-variable=<variable>

#destroy the all of the infrastruture
terraform destroy

#Get provider names, info used in configuration 
terraform providers

provider "aws" {
        region = "us-east-1"
}

resource "aws_instance" "vm" {
        ami = ""
        subnet_id = ""
        instance = "t3.micro"
        tags = {
                Name = "my-first-tf-node"
        }
}

