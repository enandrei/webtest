node {
   def mvnHome, pom, version, deployedVersion
    stage('Checkout') { 
        git 'https://github.com/enandrei/webtest.git'
        mvnHome = tool 'M339'
        pom = readMavenPom file: 'pom.xml'
        version = pom.version.replace("-SNAPSHOT", ".${currentBuild.number}")
    }
    
    stage('Build') {
        sh "'${mvnHome}/bin/mvn' -B -DbuildVersion=${version} -DdevelopmentVersion=${pom.version} -Dmaven.test.failure.ignore clean package"
    }
    stage('Deploy') {
        configFileProvider([configFile(fileId: '16aca6c0-a047-47db-bc2a-ced28129181b', variable: 'MAVEN_SETTINGS')]) {
            sh "'${mvnHome}/bin/mvn' -B -s \$MAVEN_SETTINGS -Dmaven.test.failure.ignore tomcat7:deploy-only"
        }
    }
    stage('Check app'){
        sh "if [ \$(curl --silent --output /dev/null --write-out \"%{http_code}\" http://172.17.0.3:8080/web/) -ne 200 ]; then exit 1; fi"
    }
    stage('Wait for checks'){
        deployedVersion = sh(returnStdout: true, script: "curl --silent http://172.17.0.3:8080/web/ | grep -oP '(?<=Build-Version: ).*?(?=</h2)'").trim()
        input "We built $version and $deployedVersion was deployed to dev server. Should we proceed to stage ?"
    }
}
