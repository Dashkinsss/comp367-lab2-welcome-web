pipeline {
  agent any

  stages {
    stage('Checkout') {
      steps { checkout scm }
    }

    stage('Build') {
      steps {
        dir('welcome-web') {
          sh '/usr/local/bin/mvn -B clean package'
        }
      }
    }
  }
}