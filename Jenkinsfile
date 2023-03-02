pipeline {
  agent any

  stages {
    stage('Terraform init') {
      agent { label 'Slave 1' }
	steps {
	  dir('/home/ubuntu/workspace/Lambda/terraform-configuration') {
	    sh 'terraform init'
    }
  }
}
    stage('Build Application') {
     agent { label 'Slave 1' }
      steps {
        dir('/home/ubuntu/workspace/Lambda/src') {
        sh 'zip hello.zip hello.js && zip /home/ubuntu/workspace/Lambda/terraform-configuration/hello.zip hello.js'
	stash includes: 'hello.zip', name: 'hello.zip'
    }
  }
}
    stage('Provision S3 Bucket and Lambda') {
     agent { label 'Slave 2' }
      steps {
        dir('/home/ubuntu/workspace/Lambda/terraform-configuration') {
	  unstash 'hello.zip'
	  sh 'terraform init'
	  sh 'terraform apply -target=aws_s3_bucket.mybucket --auto-approve'
	  sh 'aws s3 mv s3://leumi-exercise2/hello.zip s3://leumi-exercise2/hello.zip${BUILD_NUMBER}'
	  sh 'aws s3 cp hello.zip s3://leumi-exercise2'
	  sh 'terraform apply -target=aws_lambda_function.myLambda -target=aws_iam_role.lambda_role -target=aws_iam_role_policy_attachment.lambda --auto-approve'
    }
  }
}
    stage('Provision API Gateway and integrate with lambda') {
     agent { label 'Slave 1' }
      steps {
	dir('/home/ubuntu/workspace/Lambda/terraform-configuration') {
          sh 'terraform apply --auto-approve'
      }
    }
  }
}
}
