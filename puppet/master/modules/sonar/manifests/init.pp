class sonar {
  include mysql

  package {'mysql-server-5.5':
    ensure => present,
  }

  package {'mysql-client-core-5.5':
    ensure => present,
  }

  class { 'mysql::server': 
    config_hash => { 'root_password' => 'foo' }	  	
  }

  mysql::db { 'sonar':
    user     => 'sonar',
    password => 'sonar123',
    host     => 'localhost',
    grant    => ['all'],
  }

  user { "sonar":
    ensure => present,
    shell => "/bin/bash",
    gid => "sbs",
  }

  apache::vhost::proxy { 'sonar':
    servername => 'localhost',
    /*template => 'sonar/vhost-proxy.conf2.erb',*/
    port => '443',
    dest => 'ajp://127.0.0.1:8039/sonar',
    ssl  => true,
  }

  file {'/etc/apt/sources.list.d/sonar.list':
    source => 'puppet:///modules/sonar/sonar.list',
  }

  file {'/opt/sonar/conf/sonar.properties':
    source => 'puppet:///modules/sonar/sonar.properties',
  }

  package {'sonar':
    ensure => '3.4.1',
  }

  service {'sonar':
    enable => true,
    ensure => running,
    subscribe  => File['/opt/sonar/conf/sonar.properties'],
  }

  /*
    Sonar Plugins: switch-off-violations 1.3, ldap 1.2.1
    http://repository.codehaus.org/org/codehaus/sonar-plugins/


    # link Sonar home to the /export/sbs/ tree
    ln -s /opt/sonar /export/sbs/sonar/home
    
    # vhosts
    ProxyPass /sonar https://localhost/sonar/
    ProxyPassReverse /sonar http://localhost/sonar/

  */
}
