pipeline {
  agent any
    environment {
      GIT_TOKEN=credentials ('dargamenteria_github_token')
    }
  stages {
    stage('get code from repo') {
      steps {
        sh ('''
            [ -e "$WORKSPACE/actividad1-A" ] && rm -fr "$WORKSPACE/actividad1-A"
            git clone https://${GIT_TOKEN}@github.com/dargamenteria/actividad1-A
            ls -arlt 
            echo $WORKSPACE
            '''
           )

      }
    }
    stage('Test phase') {
      parallel {
        stage ('Test phase') {
          steps {
            sh ('''
                echo "Test phase" 
                cd "$WORKSPACE/actividad1-A"
                export PYTHONPATH=.
                pytest-3 --junitxml=result-test.xml $(pwd)/test/unit


                ''')
          }
        }
        stage ('Test Rest phase') {
          steps {
            sh ('''
                echo "Test phase" 
                cd "$WORKSPACE/actividad1-A"
                export PYTHONPATH=.
                export FLASK_APP=$(pwd)/app/api.py
                flask run &
                java -jar /app/wiremock/wiremock-standalone-3.5.4.jar --port 9090 --root-dir $(pwd)/test/wiremock &
                sleep 10
                pytest-3 --junitxml=result-rest.xml $(pwd)/test/rest

                ''')
          }
        }
      }
    }   

    stage ('Deploy master'){
      when {
        branch 'master'
      }
      steps {
          sh ('Deploy Master')
        }
    }
    stage ('Deploy qa'){
      when {
        branch 'qa'
      }
      steps {
          sh ('Deploy QA')
        }
    } 
    stage ('Deploy Prod'){

      when {
        branch 'prod'
      }
      steps {
          sh ('Deploy PROD')
        }
    }
    stage ('Result Test'){
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'SUCCESS') {
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
}

