class sbs::master {
  include sbs
  
  include ldap,apache-proxy,sonar
/*,jenkins,nexus,sonar*/
}
