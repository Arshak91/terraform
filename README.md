# Terraform EC2 Instance Configuration

This Terraform configuration creates an EC2 instance in AWS. The instance is launched in a VPC with a public subnet, and it has a security group that allows incoming traffic on port 22, 80 and 443.

## Prerequisites

Before you can use this Terraform configuration, you need to have the following:

- An AWS account with appropriate permissions to create EC2 instances, VPCs, subnets, and security groups.
- Terraform installed on your local machine.

## Configuration

To use this Terraform configuration, follow these steps:

1. Clone this repository to your local machine.
2. Navigate to the repository directory using your terminal or command prompt.
3. Change values variables in terraform.tfvars if you need.
4. Initialize the backend and download the required plugins by running the command terraform init.
5. Preview the changes that Terraform will make to your infrastructure by running the command terraform plan -var-file=variables.tfvars.
6. Apply the changes by running the command terraform apply -var-file=variables.tfvars.

## Variables

The following variables are used in this Terraform configuration:

- aws_region: The AWS region where the resources will be created.
- instance_type: The instance type for the EC2 instance.
- ami_id: The Amazon Machine Image (AMI) to use for the instance.
- name: The name for the EC2 instance.
- vpc_cidr: The CIDR block for the VPC.
- subnet_cidr: The CIDR block for the subnet.
- route_cidr: The CIDR block for the Route Table.

## Outputs

The following outputs are generated by this Terraform configuration:

- public_ip: The public IP address of the EC2 instance.

## Cleanup

To destroy the resources created by this Terraform configuration, run the command terraform destroy -var-file=variables.tfvars.

## Conclusion

This Terraform configuration creates an EC2 instance in AWS using best practices for infrastructure as code. You can customize the configuration to suit your specific requirements by modifying the variables used in the configuration.
