pipeline {
  agent any

  stages {
    stage('Build') {
     agent { label 'Slave 1' }
      steps {
        dir('/home/ubuntu/workspace/Lambda/src') {
        nodejs hello.js
        zip hello.zip hello.js
      }
    }
}
    stage('Provision S3 Bucket and Lambda') {
     agent { label 'Slave 2' }
      steps {
        dir('/home/ubuntu/workspace/Lambda/terraform-configuration') {
	  sh 'terraform init'
	  sh 'terraform apply -target=aws_s3_bucket.mybucket '
	  sh 'aws s3 cp /home/ubuntu/workspace/Lambda/src/hello.zip s3://leumi-exercise2'
	  sh 'terraform apply -target=aws_lambda_function.myLambda'
      }
    }
}
    stage('Provision API Gateway') {
     agent { label 'Slave 1' }
      steps {
	dir('/home/ubuntu/workspace/Lambda/terraform-configuration') {
          sh 'terraform apply -target=aws_api_gateway_rest_api.apiLambda'
          sh 'terraform apply'
      }
    }
  }
}
