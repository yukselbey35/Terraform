terraform version

terraform init

#Create an execution plan - means dry run
terraform plan

#Use -out flag to make an Output a deployment plan
terraform plan -out <plan-name>

# To get the variables from the "variables.tfvars" file
terraform plan -var-file=variables.tfvars

#use -destroy flag to make a Output destroy plan
terraform plan -destroy

#apply all the configuration
terraform apply <plan-name>

# To get the variables from the "variables.tfvars" file
terraform apply -var-file=variables.tfvars

#Only apply changes to a targeted resource
terraform apply -target=<resource-name>

#Pass a variable via the command line
terraform apply -var my-variable=<variable>

#destroy the all of the infrastruture
terraform destroy

#Get provider names, info used in configuration 
terraform providers

# workspace just like kubernetes namespace
workspace --help to see commands
