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
    $server_name    = $server::server_name,
    $docroot        = $server::docroot,
    $dir_options    = $server::dir_options,
    $dir_override   = $server::dir_override
) {
    #------------------------------------------
    # Apache
    #------------------------------------------
    class { "apache": }
    apache::vhost { "${server_name}":
            port                        => '80',
            server_name                 => "${server_name}",
            docroot                     => "${docroot}",
            directory                   => "${docroot}",
            directory_options           => "${dir_options}",
            directory_allow_override    => "${dir_override}",
            require                     => File["/var/www/html/${server_name}"],
    }

    # Setting up the document root
    file { ['/var/www', '/var/www/html'] :
            ensure => directory,
    }

    # symlink the vagrant shared folder to the document root
    file { "/var/www/html/${server_name}":
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
