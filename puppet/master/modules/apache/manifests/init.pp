class apache {
  package {'apache2':
    ensure => present,
  }
  
  package {'openssl':
    ensure => present,
  }
  
  package {'ssl-cert':
    ensure => present,
  }

  /* 
  TODO:
  
    # Create self-signed certificates
    /usr/bin/openssl req -new -x509 -days 365 -nodes -batch \
            -out /export/sbs/apache2/ssl/server.crt -outform PEM \
            -keyout /export/sbs/apache2/ssl/server.key -keyform PEM >&2 

    # enable modules
    a2enmod ssl >&2 
    a2enmod authnz_ldap >&2 
    a2enmod proxy_http >&2 
    a2enmod rewrite >&2 

    # enable site
    a2ensite sbs >&2 

    # sbs.vhost
    LoadModule proxy_module modules/mod_proxy.so
    LoadModule proxy_http_module modules/mod_proxy_http.so
    LoadModule rewrite_module modules/mod_rewrite.so
    LoadModule ssl_module modules/mod_ssl.so
    #LoadModule proxy_balancer_module modules/mod_proxy_balancer.so

    */

  service {'apache2':
    ensure => restarted,
  }
}