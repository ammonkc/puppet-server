# Class server::php
#
# Actions:
#   Configure a PHP
#
# Reqiures:
#   You should probably be on an Enterprise Linux variant. (Centos, RHEL, Scientific, Oracle, Ascendos, et al)
#
# Sample Usage:
#  include server::php
#
class server::php (
    $install_composer    = true
) {
    #------------------------------------------
    # PHP
    #------------------------------------------
    # Install remi repo
    class { 'repo::remi': stage => pre; }
    # Install php modules
    # class { 'php': }
    php::module {
        [
            'pear',
            'devel',
            'mcrypt',
            'mbstring',
            'mysql',
            'gd',
            'xml',
            'bcmath',
            'pecl-apc',
        ]:
    }

    if $install_composer == true {
        class { 'server::composer':
          command_name => 'composer',
          target_dir   => '/usr/local/bin'
        }
    }
}
