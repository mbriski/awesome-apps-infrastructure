# Terraform and configuration scripts

This is the readme for the infra EC2 setup of Awesome apps.

## Prerequisites

1. [AWS CLI](https://aws.amazon.com/cli/)
3. [Terraform](https://www.terraform.io/)

## AWS CLI

Install CLI
Configure IAM access role with AmazonEC2FullAccess permissions
Generate AccessKey
Configure aws CLI with:
```
aws configure
```

## Jenkins EC2

Navigate to jenkins folder
Execute:
```
terraform init
terraform apply
```

## App-server EC2

Navigate to app-server folder
Execute:
```
terraform init
terraform apply
```

## Additional configuration

Failed to mount EFS with cloudinit 
Additional scripts must be executed
First get names and IPs for EC2 instances
```
aws ec2 describe-instances   --filter "Name=instance-state-name,Values=running"   --query "Reservations[*].Instances[*].[Tags[?Key=='Name'].Value|[0], PublicIpAddress]"   --output text
```
Then navigate to scripts folder and run configure.sh script on each server
```
ssh -i $KeyPairPemFile ec2-user@$ServerPublicIp < configure.sh
```
