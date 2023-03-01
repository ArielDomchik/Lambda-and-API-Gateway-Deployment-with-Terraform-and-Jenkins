pipeline {
  agent any

  stages {
    stage('Build') {
     agent { label 'Slave 1' }
      steps {
        dir('/home/ubuntu/workspace/Lambda/src') {
        sh 'nodejs hello.js'
        sh 'zip hello.zip hello.js'
      }
    }
}
    stage('Provision S3 Bucket and Lambda') {
     agent { label 'Slave 2' }
      steps {
        dir('/home/ubuntu/workspace/Lambda/terraform-configuration') {
	  sh 'terraform init'
	  sh 'terraform apply -target=aws_s3_bucket.mybucket --auto-approve'
	  sh 'aws s3 cp /home/ubuntu/workspace/Lambda/src/hello.zip s3://leumi-exercise2'
	  sh 'terraform apply -target=aws_lambda_function.myLambda --auto-approve'
	  sh 'terraform apply -target=aws_iam_role_policy_attachment.lambda --auto-approve'
      }
    }
}
    stage('Provision API Gateway') {
     agent { label 'Slave 1' }
      steps {
	dir('/home/ubuntu/workspace/Lambda/terraform-configuration') {
	  sh 'terraform init'
          sh 'terraform apply -target=aws_api_gateway_rest_api.apiLambda --auto-approve'
          sh 'terraform apply -target=aws_api_gateway_resource.proxy --auto-approve'
	  sh 'terraform apply -target=aws_api_gateway_method.proxyMethod --auto-approve'
	  sh 'terraform apply -target=aws_api_gateway_integration.lambda --auto-approve'
	  sh 'terraform apply -target=aws_api_gateway_method.proxy_root --auto-approve'
	  sh 'terraform apply -target=aws_aws_api_gateway_integration.lambda_root --auto-approve'
	  sh 'terraform apply -target=aws_api_gateway_deployment.apideploy --auto-approve'
	  sh 'terraform apply -aws_lambda_permission.apigw --auto-approve'
	  sh 'terraform apply -refresh-only'
      }
    }
  }
}
}
