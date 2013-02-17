class sbs::sonar {

  include sonar

  class { 'sonar' :
    version => '3.4.1',
  }

  include apache
  /* FIXME: Without this we get a ... */
  include apache::params

  apache::vhost::proxy { 'sonar':
    servername => "sbs.jcoderz.org",
    port => 443,
    dest => "http://localhost:8080",
    ssl => true,
    priority => 11,
    vhost_name => "*",
  }

}
