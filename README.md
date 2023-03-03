
# Lambda and API Gateway Deployment with Terraform and Jenkins

This project demonstrates how to deploy a Lambda function and API Gateway using Terraform and Jenkins.

## Requirements

This project requires:

-   AWS account
-   Jenkins server
-   Jenkins agents
-   Terraform

## Installation

To install this project, follow these steps:

1.  Clone this repository to your local machine.
2.  Install Jenkins on a server or machine.
3.  Install Terraform on the Jenkins server or machine agents.
4.  Create an AWS IAM Role with the necessary permissions for deploying Lambda and API Gateway resources. Use the principle of least privilege when defining the IAM role.
5.  Set up AWS CLI on the Jenkins server or machine agents with `aws configure` and enter your AWS access key and secret access key.
6.  Label the Jenkins agents appropriately in the Jenkins UI to ensure the correct stages of the pipeline run on the correct agents.
7.  Configure Terraform to use the Terraform Cloud backend for the state files (found on `main.tf`). This is recommended for collaborative projects and to avoid issues with concurrent state file access.
8.  Create a Jenkins pipeline project with the following stages:
    1.  Build: Zip the Lambda function code.
    2.  Copy the artifacts between the agents (using stash and unstash).
    3.  Provision S3 Bucket and Lambda: Create an S3 bucket, upload the Lambda code, create a Lambda function and IAM role.
    4.  Provision API Gateway: Create an API Gateway and integration with the Lambda function.
9.  Run the pipeline to deploy the Lambda function and API Gateway.

## Usage

To use this project:

1.  Make changes to the Lambda function code in `/src/hello.js`.
2.  Commit and push the changes to the repository.
3.  Run the Jenkins pipeline to deploy the updated Lambda function and API Gateway.
