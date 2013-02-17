class sbs {
  user { "sbs":
    ensure => present,
    shell => "/bin/bash",
  }

  package { 'openjdk-7-jdk': 
    ensure => present,
  }

/*

TODO:
   * add group sbs
   * add group to all users jenkins, nexus, sonar
   * chmod all folders to group sbs
*/
}

