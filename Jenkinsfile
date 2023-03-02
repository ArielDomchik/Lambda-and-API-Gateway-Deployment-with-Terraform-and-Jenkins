pipeline {
  agent any

  stages {
    stage('Init') {
      agent { label 'Slave 1' }
	steps {
	  dir('/home/ubuntu/workspace/Lambda/terraform-configuration') {
	    sh 'terraform init'
	  }
	}
}
    stage('Build') {
     agent { label 'Slave 1' }
      steps {
        dir('/home/ubuntu/workspace/Lambda/src') {
        sh 'zip hello.zip hello.js'
	archiveArtifacts artifacts: 'hello.zip', onlyIfSuccessful: true
      }
    }
}
    stage('Provision S3 Bucket and Lambda') {
     agent { label 'Slave 2' }
      steps {
        dir('/home/ubuntu/workspace/Lambda/terraform-configuration') {
	  copyArtifacts(projectName: 'Lambda', filter: 'hello.zip', selector: lastSuccessful(), fingerprintArtifacts: true, target: '/home/ubuntu/workspace/Lambda/src')
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
          sh 'terraform apply --auto-approve'
      }
    }
  }
}
}
