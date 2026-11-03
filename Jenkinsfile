pipeline{
  agent any

  environment{
    IMAGE_NAME = 'pysquare'
    TAG = 'latest'
  }
  stages{
    stage('Pull from git hub'){
      steps{
        git branch: 'main', url: 'https://github.com/satejc2425/Q2-python-square-JenkinsFile.git'
      }
    }

    stage('Build docker image'){
      steps{
        script{
          try{
            sh "docker rmi -f ${IMAGE_NAME}:${TAG}"
          }catch (Exception e){
            echo "Image not found with the '${IMAGE_NAME}:${TAG}'"
          }
          sh "docker build -t ${IMAGE_NAME}:${TAG} ."
        }
      }
    }
    stage('Run docker image'){
      steps{
        script{
          sh "docker run ${IMAGE_NAME}:${TAG}"
        }
      }
    }
  }
post{
  success{
     echo 'Python application Docker image built successfully.'
  }
  failure{
    echo 'Docker build failed'
    
  }
}
}
