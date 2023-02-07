# ItechArt-internship-task3
* Create the Custom VPC using Terraform - You can use module or resource block vpc 
* Add the firewall rules to allow traffic at port-80 at the above-created VPC  
* Create the EC2 instance in the AWS at inside the created VPC 
* Install the Nginx on the created instance


## To run the code follow below steps:
### Create key-pair(for ssh), if it's not created already, use below command to create and store:
```
aws ec2 create-key-pair --key-name MyKeyPair --query 'KeyMaterial' --output text > ~/.ssh/MyKeyPair.pem
chmod 400  ~/.ssh/MyKeyPair.pem
```

### To execute the code use below given terraform commands:
```
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply --auto-approve
```

### then to destroy the created resources use below command:
```
terraform destroy --auto-approve

