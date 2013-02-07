class mysql {
  package {'mysql-server-5':
    ensure => present
  }
  
  /*
  TODO: Add the my.cnf values we have adapted for the SBS instances #1,#2
  */
}
