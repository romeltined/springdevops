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
                    sh 'docker build -t /springdevops .'
                }
            }
        }
        stage('Push image to Hub'){
            steps{
                script{
                   withCredentials([usernamePassword(credentialsId: 'mydockerhub-pwd', passwordVariable: 'docker-p', usernameVariable: 'docker-u')])  {
                   sh 'docker login -u romeltined -p dckr_pat_n8NwWQE2w383T_Xs0H-beFq8fYg'
                    }
                    sh 'docker push romeltined/springdevops'
                }
            }
        }
    }
}
