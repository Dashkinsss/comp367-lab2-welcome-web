pipeline {
  agent any

  stages {
    stage('Checkout') {
      steps { checkout scm }
    }

    stage('Build') {
      steps {
        sh '/usr/local/bin/mvn -B clean package'
      }
    }
  }
}