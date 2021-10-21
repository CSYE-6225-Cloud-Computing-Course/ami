# Packer & AMIs
CSYE 6225 Fall 2021 Assignment 3 
## Dependencies

* ### Install and Configure AWS Command Line Interface
    - Install and configure AWS Command Line Interface (CLI) on your development machine (laptop). See Install the AWS Command Line Interface on [Linux](https://docs.aws.amazon.com/cli/latest/userguide/install-linux.html) for detailed instructions.
    - Create profiles for your AWS account
    - Configure [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-configure.html)

* ### Install Terraform
  - [Terraform](https://www.terraform.io/)

* ### Install Packer
  - [Packer](https://www.packer.io/downloads)

## Select the AWS CLI profile

To use Dev Environment, run 

```
export AWS_PROFILE=dev
```

To use Prod Environment, run

```
export AWS_PROFILE=prod
```

## Getting Started

1. Run [terraform scripts](https://github.com/swaroopgupta-ba/infrastructure#terraform-scripts) from Assignment 2 to create a VPC and subnets
2. Clone the repository to your local machine
3. cd ami
4. Create a vars.json file with required variable (aws_region, subnet_id, source_ami, instance_type), Use subnet_id created using Step 1

## Build AMI

```
run buildAMI.sh
```

## Deploy Web Application built as part of [assignment 1](https://github.com/swaroopgupta-ba/webapp)

* ### Launch ec2 with appropriate VPC, security group configurations using the AMI built
* ### Copy web application files to home directory of ec2 instance
  
  ```
  scp [OPTION] [user@]SRC_HOST:]file1 [user@]DEST_HOST:]file2
  ```
  - OPTION - scp options such as cipher, ssh configuration, ssh port, limit, recursive copy …etc.
  - [user@]SRC_HOST:]file1 - Web all files.
  - [user@]DEST_HOST:]file2 - Destination file
  
* ### SSH into ec2 instance created using above step
  
   ```
  scp [OPTION] [user@]hostname:]
  ```
  - OPTION - scp options such as cipher, ssh configuration, ssh port, limit, recursive copy …etc.
  - [user@]hostname:] - ec2 instance DNS Address
* ### Install Required dependencies

1. Install and configure Mysql server
   ```
   sudo apt-get install mysql-server -y
   ```
2. Navigate to web app directory copied in step 2 and install dependencies 
   ```
   npm install
   ```
3. Start the application
    ```
   npm start
   ```

## Test the following [REST APIs](https://app.swaggerhub.com/apis-docs/csye6225-fall2021/webapp/A01#/) using Postman
1. Create a new user record
  ```
  POST [DNS of ec2 instance]/v1/user 
  ```
2. Get user information with required authentication
  ```
  GET [DNS of ec2 instance]/v1/user/self
  ```
3. Update user information  with required authentication
  ```
  PUT [DNS of ec2 instance]/v1/user/self
  ```

