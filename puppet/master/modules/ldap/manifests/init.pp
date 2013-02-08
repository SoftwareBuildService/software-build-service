class ldap {
  package {'slapd':
    ensure => present,
  }

  service {'slapd':
    ensure => running,
  }

  package {'ldap-utils':
    ensure => present,
  }

  package {'phpldapadmin':
    ensure => present,
  }

  /*
    ADMIN_PW=admin123
    READ_USER_NAME=sbs123
    READ_USER_PW_TEXT=sbs123
    READ_USER_PW=`slappasswd -s $READ_USER_PW_TEXT`
    DC1=sbs
    DC2=org
    CONF_FILE=/export/sbs/etc/slapd.conf
    CONF_DIR=/etc/ldap/slapd.d
    TEMP_LDIF=/tmp/ldap-database.ldif

    echo "##################################"
    echo "#  Copying slapd.conf            #"
    echo "##################################"

    if [ -d $CONF_DIR ];
    then
        mv  $CONF_DIR /etc/ldap/slapd.d.back
        echo "Directory $CONF_DIR renamed to /etc/ldap/slapd.d.back"
    else
        echo "Directory $CONF_DIR does not exists"
    fi

    if [ -f $CONF_FILE ];
    then
        cp $CONF_FILE /etc/ldap/slapd.conf
        chown openldap:openldap /etc/ldap/slapd.conf
        echo "File $CONF_FILE copied to /etc/ldap/slapd.conf"
    else
        echo "File $CONF_FILE does not exists"
        exit 1
    fi

    echo would call: slapadd -v -f /etc/ldap/slapd.conf -l $TEMP_LDIF -b dc=$DC1,dc=$DC2
    rm $TEMP_LDIF
  */
}
