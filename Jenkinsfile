pipeline {
    agent any
    stages{

       // stage('Parallel qa') {
       //   parallel{

       //     stage('Parallel 1'){
       //       steps{
       //           sh "trivy filesystem -f json -o results.json ."
       //           recordIssues(tools: [trivy(id:'firstone',pattern: 'results.json')])

       //       }
       //     }
       //     stage('Paralel 2'){
       //       steps{

       //             sh "trivy image -f json -o results2.json adriangarcia33/2048:latest"
       //             recordIssues(tools: [trivy(id:'secondone',pattern: 'results2.json')])

       //       }

       //     }

       //     }

       //   }
        stage('Build') {
            steps {
              sh "docker-compose build"
            }

          //post {
                        //success {
                            //junit 'build/test-results/test/*.xml'
                            //archiveArtifacts 'build/libs/*.jar'
                            //jacoco()
                            //recordIssues(tools: [pmdParser(pattern: 'build/reports/pmd/*.xml')])
                            //recordIssues(tools: [pit(pattern: 'build/reports/pitest/*.xml')])
                         //recordIssues(tools: [trivy(pattern: 'results.json')])
                         //recordIssues(tools: [trivy(pattern: 'results2.json')])

                        //}

          //}

        }

        stage('Publish') {
                 steps {
                    sshagent(['git-1']){
                        sh 'git tag BUILD-1.0.${BUILD_NUMBER}'
                        sh 'git push --tags'
                    }
                }
            }


        stage('DockerHub'){
          steps{
          withCredentials([usernamePassword(credentialsId: 'adriangarcia33', passwordVariable: 'PASS', usernameVariable: 'USER')]) {
             //sh "echo '${PASS}' | docker login -u '${USER}' --password-stdin"
             //sh 'docker tag adriangarcia33/2048 ${USER}/2048:latest'
             //sh 'docker tag adriangarcia33/2048 ${USER}/2048:BUILD-1.0.${BUILD_NUMBER}'
             //sh 'docker push ${USER}/2048:latest'
             //sh 'docker push ${USER}/2048:BUILD-1.0.${BUILD_NUMBER}'
          }
          withCredentials([usernamePassword(credentialsId: 'adriangarcia3', passwordVariable: 'gitPassword', usernameVariable: 'gitUsername')]) {
                              sh "echo '${gitPassword}' | docker login ghcr.io -u '${gitUsername}' --password-stdin"
                              sh 'docker tag adriangarcia33/2048:latest ghcr.io/${gitUsername}/2048:latest'
                              sh 'docker tag adriangarcia33/2048:latest ghcr.io/${gitUsername}/2048:BUILD-1.0.${BUILD_NUMBER}'
                              sh 'docker push ghcr.io/${gitUsername}/2048:latest'
                              sh 'docker push ghcr.io/${gitUsername}/2048:BUILD-1.0.${BUILD_NUMBER}'
                          }

        }
        stage('Ansible'){
                    steps {
                     // withAWS(credentials: 'CredencialesAWS', profile: 'default', region: 'eu-west-1') {
                          ansiblePlaybook credentialsId: 'CredencialesAWS', disableHostKeyChecking: true, playbook: '/home/sinensia/ansible/tas-docker-full.yaml'
                     // }
               }
        }
    }
}
}
