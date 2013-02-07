class jenkins {
  require => Package['apache'];
  require => Package['sbs-base'];

  package {'jenkins':
    ensure => present,
  }

  user { "jenkins":
    ensure => present,
    shell => "/bin/bash",
    gid => "sbs",
  }

  /*
    Jenkins Plugins: maven, sonar, subversion
    
    # run configure from the postinst script
    dpkg-reconfigure --frontend=noninteractive -u jenkins

    # rename properties file
    mv /etc/default/jenkins /etc/default/jenkins.orig
    mv /etc/default/jenkins.sbs /etc/default/jenkins

    [ -r /etc/default/jenkins ] && . /etc/default/jenkins
            : ${JENKINS_USER:=jenkins}
            
    # make sure jenkins can delete everything in /var/cache/jenkins to re-explode war. 
    chown -R $JENKINS_USER:sbs /var/cache/jenkins /var/lib/jenkins /var/log/jenkins
    chmod -R 750               /var/cache/jenkins /var/lib/jenkins /var/log/jenkins

    # Download
    http://pkg.jenkins-ci.org/debian/binary/jenkins_1.500_all.deb


    # vhosts
    ProxyPass /jenkins https://localhost/jenkins/
    ProxyPassReverse /jenkins https://localhost/jenkins/

    */
}
