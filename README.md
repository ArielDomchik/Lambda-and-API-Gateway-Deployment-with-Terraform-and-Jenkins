Lambda and API Gateway Deployment with Terraform and Jenkins

This project demonstrates how to deploy a Lambda function and API Gateway using Terraform and Jenkins.
Requirements

    AWS account
    Jenkins server
    Terraform

Installation

    Clone this repository to your local machine
    Install Jenkins on a server or machine
    Install Terraform on the Jenkins server or machine agents
    Create an AWS IAM Role with the necessary permissions for deploying Lambda and API Gateway resources
    Set up AWS CLI on the Jenkins server or machine agents with 'aws configure' with your key
    Create a Jenkins pipeline project with the following stages:
        Build: zip the Lambda function code
        Provision S3 Bucket and Lambda: create an S3 bucket, upload the Lambda code, create a Lambda function and IAM role
        Provision API Gateway: create an API Gateway and integration with the Lambda function
    Run the pipeline to deploy the Lambda function and API Gateway

Usage

    Make changes to the Lambda function code in /src/hello.js
    Commit and push the changes to the repository
    Run the Jenkins pipeline to deploy the updated Lambda function and API Gateway
