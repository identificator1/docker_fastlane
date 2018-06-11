# docker_fastlane

It's a project-specific image.

Build android app using fastlane.
See tools installed in the Dockerfile.

It is used and updated while not in the private repo.
identificator/fastlane - on DockerHub.

docker_ubuntu16 -> docker_java8 -> docker_android -> docker_fastlane

Jenkins pipeline basic:

```
pipeline {
    agent { label 'docker'}
    stages {
        stage('Check initial image') {
            steps {
                sh "docker pull identificator/fastlane:latest"
            }
        }
        stage('Checkout project from git SCM') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/dev']], doGenerateSubmoduleConfigurations: false, extensions: [[$class: 'SubmoduleOption', disableSubmodules: false, parentCredentials: false, recursiveSubmodules: true, reference: '', trackingSubmodules: false]], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'somethinghere', url: 'git@gitserver:projectrepo/projectname.git']]])
            }
        }
        stage('Docker Run') {
            steps {
                sh "docker run --rm -v `pwd`:/opt/app identificator/fastlane:latest bash -c 'cd app; fastlane lane lane:params --verbose'"
                }
        }
    }
}
```
