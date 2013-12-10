# Class server::httpd
#
# Actions:
#   Configure a httpd server
#
# Reqiures:
#   You should probably be on an Enterprise Linux variant. (Centos, RHEL, Scientific, Oracle, Ascendos, et al)
#
# Sample Usage:
#  include server::httpd
#
class server::httpd (
    $enabled    = true,
) {
    #------------------------------------------
    # Apache
    #------------------------------------------
    info("Configure LAMP Stack")

    class { "apache": }
    apache::vhost { "${fqdn}":
            port                        => '80',
            server_name                 => "${fqdn}",
            docroot                     => "/var/www/html/${fqdn}/public",
            directory                   => "/var/www/html/${fqdn}/public",
            directory_options           => '-Indexes -Includes -FollowSymLinks SymLinksifOwnerMatch ExecCGI MultiViews',
            directory_allow_override    => 'All',
            require                     => File["/var/www/html/${fqdn}"],
    }

    # Setting up the document root
    file { ['/var/www', '/var/www/html'] :
            ensure => directory,
    }

    # symlink the vagrant shared folder to the document root
    file { "/var/www/html/${fqdn}":
        ensure  => "link",
        target  => "/vagrant",
        require => Package["httpd"],
        notify  => Service["httpd"]
    }

    # Open up port 80 in iptables
    firewall { '100 allow httpd:80':
        state   => ['NEW'],
        dport   => '80',
        proto   => 'tcp',
        action  => 'accept',
    }
}
