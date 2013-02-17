class sbs::nexus {

  include apache
  /* FIXME: Without this we get a ... */
  include apache::params

  apache::vhost::proxy { 'nexus':
    servername => "sbs.jcoderz.org",
    port => 443,
    dest => "http://localhost:8080",
    ssl => true,
    priority => 10,
    vhost_name => "*",
  }



  /*
    # repackage the Nexus tar.gz
    http://developer.ubuntu.com/packaging/html/packaging-new-software.html#building-the-package

    chown -R nexus:sbs /opt/nexus-2.0.6

    # Create start/stop links
    chmod 750 /etc/init.d/nexus
    update-rc.d nexus defaults >&2 

    set +e
    mv /export/sbs/nexus/sonatype-work/nexus/conf/security-configuration.xml /export/sbs/nexus/sonatype-work/nexus/conf/security-configuration.xml.orig
    mv /export/sbs/nexus/sonatype-work/nexus/conf/ldap.xml /export/sbs/nexus/sonatype-work/nexus/conf/ldap.xml.orig
    mkdir -p /export/sbs/nexus/sonatype-work/nexus/conf/
    set -e

    cp /export/sbs/nexus/conf/security-configuration.xml /export/sbs/nexus/sonatype-work/nexus/conf/
    cp /export/sbs/nexus/conf/ldap.xml /export/sbs/nexus/sonatype-work/nexus/conf/

    mv /opt/nexus-2.0.6/conf/nexus.properties /opt/nexus-2.0.6/conf/nexus.properties.orig
    cp /export/sbs/nexus/conf/nexus-sbs.properties /opt/nexus-2.0.6/conf/nexus.properties

    chown nexus:sbs /opt/nexus-2.0.6/conf/nexus.properties
    chmod 644 /opt/nexus-2.0.6/conf/nexus.properties

    chown -R nexus:sbs /export/sbs/nexus/sonatype-work

    /etc/init.d/nexus start >&2 

    # link Nexus home to the /export/sbs/ tree
    ln -s /opt/nexus-2.0.6 /export/sbs/nexus/home

    // #####################################################
    puppet module install runthebusiness/fetchfile
        Nexus               http://www.sonatype.org/downloads/nexus-2.3.0-04-bundle.zip


    package { 'nexus':
      ensure          => installed,
      provider        => 'zip',
      source          => 'http://www.sonatype.org/downloads/nexus-2.3.0-04-bundle.zip',
      install_options => { 'INSTALLDIR' => '/export/sbs/nexus' },
    }

    fetchfile{"nexus":
        downloadurl => 'http://www.sonatype.org/downloads/nexus-2.3.0-04-bundle.zip',
        desintationpath => '/export/sbs/nexus',
        owner=><owner of destination file>,
        group=><group of destination file>,
        mode=><permissions of destination file>
    }

    # vhosts
    ProxyPass /nexus https://localhost/nexus/
    ProxyPassReverse /nexus http://localhost/nexus/

  */
}
