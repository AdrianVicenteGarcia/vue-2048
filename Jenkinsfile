pipeline {
    agent any
    stages{

        stage('Parallel qa') {
          parallel{

            stage('Parallel 1'){
              steps{
                  sh "trivy filesystem -f json -o results.json ."

              }
            }
            stage('Paralel 2'){
              steps{

                    sh "trivy image -f json -o results2.json nginx:latest"

              }

            }

            }

          }
        stage('Build') {
            steps {
              sh "docker-compose build"
            }

          post {
                        success {
                            //junit 'build/test-results/test/*.xml'
                            //archiveArtifacts 'build/libs/*.jar'
                            //jacoco()
                            //recordIssues(tools: [pmdParser(pattern: 'build/reports/pmd/*.xml')])
                            //recordIssues(tools: [pit(pattern: 'build/reports/pitest/*.xml')])
                         recordIssues(tools: [trivy(pattern: 'results.json')])
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
