class sbs::apache {

  include apache

/*
mkdir -p /etc/ssl/certs
mkdir -p /etc/ssl/private
openssl req -new -x509 -nodes -out /etc/ssl/certs/pl.cert -keyout /etc/ssl/private/pl.key -days 3650 -subj '/CN=www.example.com'
chmod 600 /etc/ssl/certs/pl.*
chmod 600 /etc/ssl/private/pl.*
*/
}

