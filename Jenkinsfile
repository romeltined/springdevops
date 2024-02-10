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
                   withCredentials([usernamePassword(credentialsId: 'mydockerhub-pwd', passwordVariable: 'docker-p', usernameVariable: 'docker-u')])  {
                   sh 'docker login -u ${docker-u} --password-stdin ${docker-p}'
                    }
                    sh 'docker push romeltined/springdevops'
                }
            }
        }
    }
}
