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

/*
TODO:
Set the context path  when using the Ubuntu package by adding --prefix=/jenkins to JENKINS_ARGS in /etc/default/jenkins ( or in /etc/sysconfig/jenkins for RHEL/CentOS package)
*/
}

