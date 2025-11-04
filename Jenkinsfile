

pipeline {
// Defines where the pipeline will execute. 'agent any' means it can run on any available agent.
agent any
environment {
    // Use a unique name for the Docker image
    IMAGE_NAME = "helloworld-java:${BUILD_ID}"
}

stages {
    // Stage 1: Checkout the source code
    stage('Checkout') {
        steps {
            // Assuming the source code (HelloWorld.java and Dockerfile) 
            // is retrieved from a source control system (e.g., Git)
            checkout scm
        }
    }

    // Stage 2: Build the Docker Image
    stage('Build Image') {
        steps {
            // Use the Dockerfile to build the image and tag it with the IMAGE_NAME variable.
            // The '.' indicates the Dockerfile is in the current directory.
            echo "Building Docker image ${IMAGE_NAME}..."
            sh "docker build -t ${IMAGE_NAME} ."
        }
    }

    // Stage 3: Run a quick test to ensure the container starts and prints output
    stage('Run Test') {
        steps {
            // Runs the container and prints the output.
            // --rm ensures the container is cleaned up immediately after execution.
            echo "Running container test..."
            sh "docker run --rm ${IMAGE_NAME}"
        }
    }

    // Stage 4: Clean up the locally built image
    stage('Cleanup') {
        steps {
            echo "Cleaning up local image ${IMAGE_NAME}..."
            sh "docker rmi ${IMAGE_NAME}"
        }
    }
}

// Post-build actions (e.g., notifications)
post {
    always {
        echo 'Pipeline finished.'
    }
    success {
        echo 'Build and Test successful!'
    }
    failure {
        echo 'Build or Test failed!'
    }
}


}
