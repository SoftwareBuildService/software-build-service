class sbs::master {

  include sbs::ldap
  include sbs::apache
  include sbs::jenkins
  include sbs::nexus

  Class['sbs::ldap'] -> Class['sbs::apache'] -> Class['sbs::jenkins'] -> Class['sbs::nexus'] /* -> Class['sbs::sonar'] */

}

