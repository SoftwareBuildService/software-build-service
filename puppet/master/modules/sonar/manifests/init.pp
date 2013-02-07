class sonar {
  require => Package['apache'];
  require => Package['sbs-base'];

  package {'mysql-server-5.5':
    ensure => present,
  }

  user { "sonar":
    ensure => present,
    shell => "/bin/bash",
    gid => "sbs",
  }

  /*
    Sonar Plugins: switch-off-violations, setools, ldap

    (
    mysql -u root -pCAmr80hfzbcIO6k8g3Y9 <<EOF
    CREATE DATABASE sonar CHARACTER SET utf8 COLLATE utf8_general_ci;

    CREATE USER 'sonar' IDENTIFIED BY 'sonar';
    GRANT ALL ON sonar.* TO 'sonar'@'%' IDENTIFIED BY 'sonar';
    GRANT ALL ON sonar.* TO 'sonar'@'localhost' IDENTIFIED BY 'sonar';
    FLUSH PRIVILEGES;
    EOF
    ) >&2 

    # link Sonar home to the /export/sbs/ tree
    ln -s /opt/sonar /export/sbs/sonar/home
    
    # Download
    http://downloads.sourceforge.net/project/sonar-pkg/deb/binary/sonar_3.4.1_all.deb
    

    # vhosts
    ProxyPass /sonar https://localhost/sonar/
    ProxyPassReverse /sonar http://localhost/sonar/

  */
}