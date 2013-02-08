class sbs::master {
  include sbs
  
  include ldap,apache,jenkins,nexus,sonar
}
