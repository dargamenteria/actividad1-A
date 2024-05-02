@Library('test-pipeline-library')_


pipeline {
  agent { label 'agent2' }
  environment {
    GIT_TOKEN=credentials ('dargamenteria_github_token')
  }
  stages {
    stage('Pipeline Info') {
      steps {
        sh ('echo "        pipelineBanner "')
          pipelineBanner()
      }
    }
    stage('Build phase') {
      agent { label 'agent2' }
      steps {
        pipelineBanner()
          sh ('''
              [ -e "$WORKSPACE/actividad1-A" ] && rm -fr "$WORKSPACE/actividad1-A"
              git clone https://${GIT_TOKEN}@github.com/dargamenteria/actividad1-A
              ls -arlt 
              echo $WORKSPACE
              '''
             )
          stash  (name: 'workspace')

      }
    }
    stage('Test phase') {
      parallel {
        stage ('Test phase') {
          agent { label 'agent1' }
          steps {
            pipelineBanner()
              unstash 'workspace'
              sh ('''
                  echo "Test phase" 
                  cd "$WORKSPACE/actividad1-A"
                  export PYTHONPATH=.
                  pytest-3 --junitxml=result-test.xml $(pwd)/test/unit
                  ''')
          }
        }

        stage ('Test Rest phase') {
          agent { label 'agent1' }
          steps {
            pipelineBanner()
              unstash 'workspace'
              sh ('''
                  echo "Test phase" 
                  cd "$WORKSPACE/actividad1-A"
                  export PYTHONPATH=.
                  export FLASK_APP=$(pwd)/app/api.py
                  flask run &
                  java -jar /apps/wiremock/wiremock-standalone-3.5.4.jar --port 9090 --root-dir $(pwd)/test/wiremock &
                  sleep 10
                  pytest-3 --junitxml=result-rest.xml $(pwd)/test/rest

                  ''')
          }
        }
      }
    }   

    stage ('Result Test'){
      agent { label 'agent1' }
      steps {
        pipelineBanner()
          catchError(buildResult: 'SUCCESS', stageResult: 'SUCCESS') {
            unstash 'workspace'
              sh ('''
                  echo $(pwd)
                  sleep 10
                  ls -arlt  "$(pwd)/actividad1-A/result-*.xml"
                  junit '**/result*.xml' 

       		        junit '$(pwd)/actividad1-A/result-*.xml'  
                  ''')
          }
      }
    }
  }
  post {
    always {
      cleanWs()
    }
  }
}

