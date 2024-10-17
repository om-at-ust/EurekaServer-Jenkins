pipeline {
    agent any

    tools {
        // Install the Maven version configured as "my-maven" and add it to the path.
        maven 'my-maven'
        jdk 'my-jdk'

    }

    stages {
        stage('Git') {
            steps {
                // Get some code from a GitHub repository
                git url: 'https://github.com/sep-2024-trivandrum/service-registry.git', branch: 'main'
            }
        }

        stage('Build') {
            steps {
                // To run Maven on a Unix agent
                // sh "mvn -Dmaven.test.failure.ignore=true clean package"

                // To run Maven on a Windows agent, use
                bat 'mvn clean install'
            }
        }
        stage('Deploy') {
            steps {


                // To run Maven on a Windows agent, use
                bat 'docker build -t spring-security-server .'
                bat 'docker network create -d bridge oms-network'
                bat 'docker run --network oms-network -p 8090:8090 -d --name springsecurity-sr spring-security-server'
            }
        }
    }
}
