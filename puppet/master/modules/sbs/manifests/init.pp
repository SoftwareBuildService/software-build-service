class sbs {
  include sbs::params

  package { 'openjdk-7-jdk': 
    ensure => present,
  }

  user { "sbs":
    ensure => present,
    shell => "/bin/bash",
  }

}

