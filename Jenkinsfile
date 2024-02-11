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
                    sh 'docker build -t romeltined2/springdevops .'
                }
            }
        }
        stage('Push image to Hub'){
            steps{
                script{
                   withCredentials([usernamePassword(credentialsId: 'mydockerhub-pwd', passwordVariable: 'docker-p', usernameVariable: 'docker-u')])  {
                       def registry_url = "registry.hub.docker.com/"
                       sh 'docker login -u romeltined -p dckr_pat_n8NwWQE2w383T_Xs0H-beFq8fYg'
                    }
                    docker.withRegistry("http://${registry_url}", "mydockerhub-pwd") {
                        // Push your image now
                        sh 'docker push romeltined2/springdevops'
                    }
                }
            }
        }
    }
}
