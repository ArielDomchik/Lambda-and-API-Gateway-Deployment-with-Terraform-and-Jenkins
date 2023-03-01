- Lambda and API Gateway Deployment with Terraform and Jenkins

This project demonstrates how to deploy a Lambda function and API Gateway using Terraform and Jenkins.

- Requirements

This project requires:

    AWS account
    Jenkins server
    Jenkins agents
    Terraform

- Installation

This project requires the following steps:

    Clone this repository to your local machine.
    Install Jenkins on a server or machine.
    Install Terraform on the Jenkins server or machine agents.
    Create an AWS IAM Role with the necessary permissions for deploying Lambda and API Gateway resources. I recommend least privilege approach.
    Set up AWS CLI on the Jenkins server or machine agents with aws configure and enter your key.
    Label the Jenkins agents appropriately in the Jenkins UI to ensure the correct stages of the pipeline run on the correct agents.
    Configure Terraform to use the Terraform Cloud backend for the state files. This is recommended for collaborative projects and to avoid issues with concurrent state file access.
    Create a Jenkins pipeline project with the following stages:

    Build: zip the Lambda function code
    Provision S3 Bucket and Lambda: create an S3 bucket, upload the Lambda code, create a Lambda function and IAM role
    Provision API Gateway: create an API Gateway and integration with the Lambda function

    Run the pipeline to deploy the Lambda function and API Gateway.

- Usage

    Make changes to the Lambda function code in /src/hello.js.
    Commit and push the changes to the repository.
    Run the Jenkins pipeline to deploy the updated Lambda function and API Gateway.

Note: The pipeline may fail if the AWS resources already exist. To avoid this, you can add checks in the pipeline to see if the resources already exist before attempting to create them.
