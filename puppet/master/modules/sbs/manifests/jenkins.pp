class sbs::jenkins {

  include jenkins
  /* FIXME: Without the explicit include of jenkins::service, we will run into missing dependencies :(  */
  include jenkins::service

  include apache
  /* FIXME: Without this we get a ... */
  include apache::params

  apache::vhost::proxy { 'jenkins':
    servername => "sbs.jcoderz.org",
    port => 443,
    dest => "http://localhost:8080",
    ssl => true,
    priority => 12,
    vhost_name => "*",
  }

  /*** plugins ***/

  jenkins::plugin {
    "git" : ;
  }

  /* We need to add the --context=/jenkins parameter to JENKINS_ARGS */
  file {'/etc/default/jenkins':
    source => 'puppet:///modules/sbs/jenkins/etc/default/jenkins',
    notify  => Service["jenkins"],
    mode    => 644,
    owner   => "root",
    group   => "root",
  }

}

