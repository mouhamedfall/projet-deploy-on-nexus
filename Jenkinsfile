pipeline {
  environment {
    registry = "localhost:8083/alpine"
    registryCredential = 'nexusAdmin'
    dockerImage = ''
    dockerPush = ''
  }
  agent any
  stages {
    stage('Cloning Git') {
      steps {
        git 'https://github.com/mouhamedfall/projet-deploy-on-nexus.git'
      }
    }
    stage('Unit Tests') {
      steps {
        sh "echo 'unit tests'"
      }
    }
    stage('Building image') {
      steps{
        script {
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
    stage('Deploy Image') {
      steps{
        script {
          sh " docker login -u admin -p admin123 localhost:8083"
          sh " docker push $registry:$BUILD_NUMBER"
        }
      }
    }
    stage('Remove Unused docker image') {
        steps{
            sh "docker rmi $registry:$BUILD_NUMBER"
        }
    }
      stage('Deploy container on kubernetes') {
        steps{
            sh "echo 'deploy on kubernetes'"
        }
    }
  }
}
