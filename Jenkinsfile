@Library('pipeline-library-demo')_
pipeline {
    agent any

    options{
    timestamps()
    ansiColor('xterm')
    disableConcurrentBuilds()
    buildDiscarder(logRotator(numToKeepStr: '5', artifactNumToKeepStr: '5'))
            }

    stages {


        stage('Trivy') {
                    steps {
                        sh "trivy image -f json -o results.json nginx:latest"
                        recordIssues(tools: [trivy(pattern: 'results.json')])
                    }
                }

        stage('Build') {
            steps {
                // Get some code from a GitHub repository
                // Run Maven on a Unix agent.

                //timestamps{
                 //sh 'echo $BULD_TIMESTAMP'
                //}
                 sh 'docker-compose build'

                // To run Maven on a Windows agent, use
                // bat "mvn -Dmaven.test.failure.ignore=true clean package"
            }

            post {
                // If Maven was able to run the tests, even if some of the test
                // failed, record the test results and archive the jar file.
               success {

               recordIssues(tools:[trivy(pattern: 'results.json')])
            //        junit '*build/test-results/test/TEST-*.xml'
            //        archiveArtifacts 'build/libs/*.jar'
               }
            }
        }
        stage('Publish') {
        steps{
            sshagent(['git-1']){
                sh 'git tag BUILD-1.0.${BUILD_NUMBER}'
                sh 'git push --tags'
        }
       }
     }
    }
}
