pipeline {
    agent any

    environment {
        STUDENT_NAME = 'Abdambayev Adilzhan'
        STUDENT_ID   = '37144'
        IMAGE_NAME   = 'abdambayev-adilzhan-student-api'
        IMAGE_TAG    = 'v1.0-37144'
    }

    stages {
        stage('Checkout') {
            steps {
                echo "Student: ${STUDENT_NAME} (ID ${STUDENT_ID}) - pipeline started"
                checkout scm
                sh 'git log -1 --oneline'
            }
        }
        stage('Build') {
            steps {
                echo "Building application for ${STUDENT_NAME}"
                sh 'chmod +x gradlew'
                sh './gradlew clean bootJar -x test --no-daemon'
            }
        }
        stage('Test') {
            steps {
                sh './gradlew test --no-daemon'
            }
            post {
                always {
                    junit allowEmptyResults: true, testResults: 'build/test-results/test/*.xml'
                }
            }
        }
        stage('Docker Build') {
            steps {
                sh 'docker build -t ${IMAGE_NAME}:${IMAGE_TAG} .'
            }
        }
        stage('Verify') {
            steps {
                sh 'docker image inspect ${IMAGE_NAME}:${IMAGE_TAG} > /dev/null'
                sh 'docker images ${IMAGE_NAME}:${IMAGE_TAG}'
                echo "VERIFIED: image ${IMAGE_NAME}:${IMAGE_TAG} exists. Built by ${STUDENT_NAME}"
            }
        }
    }

    post {
        success { echo "BUILD SUCCESS - ${STUDENT_NAME}" }
        failure { echo "BUILD FAILED - ${STUDENT_NAME}" }
    }
}
