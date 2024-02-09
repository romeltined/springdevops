pipeline {
    agent any
    tools{
        maven 'maven_3_5_0'
    }
    stages{
        stage('Build Maven'){
            steps{
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/romeltined/springdevops']]])
                sh 'mvn clean install'
            }
        }
        stage('Build docker image'){
            steps{
                script{
                    sh 'docker build -t romeltined/springdevops .'
                }
            }
        }
        stage('Push image to Hub'){
            steps{
                script{
                    withCredentials([usernamePassword(credentialsId: 'dockerhub-pswd', passwordVariable: 'dockerhub-p', usernameVariable: 'dockerhub-u')]) {
                    sh 'docker login -u ${dockerhub-u} -p ${dockerhub-p}'
                    }
                    sh 'docker push romeltined/springdevops'
                }
            }
        }
    }
}
