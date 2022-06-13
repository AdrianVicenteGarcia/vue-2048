pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                // Get some code from a GitHub repository
                // Run Maven on a Unix agent.
                sh "./gradlew test assemble"

                // To run Maven on a Windows agent, use
                // bat "mvn -Dmaven.test.failure.ignore=true clean package"
            }

            post {
                // If Maven was able to run the tests, even if some of the test
                // failed, record the test results and archive the jar file.
                success {
                    junit '*build/test-results/test/TEST-*.xml'
                    archiveArtifacts 'build/libs/*.jar'
                }
            }
        }
        stage('Publish') {
        steps{
            sshagent(['github-ssh']){
                sh 'git tag BUILD-1.0.${BUILD_NUMBER}'
                sh 'git push --tags'
        }
       }
     }
    }
}