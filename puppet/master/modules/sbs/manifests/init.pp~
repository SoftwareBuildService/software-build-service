class sbs {
  /*
    update-alternatives --set java /usr/lib/jvm/java-7-openjdk-amd64/jre/bin/java >&2
  */
  package { 'openjdk-7-jdk': 
    ensure => present,
  }

  // ### technical users ###

  user { "sbs":
    ensure => present,
    shell => "/bin/bash",
  }

}
