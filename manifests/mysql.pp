# Class server::mysql
#
# Actions:
#   Configure a MySQL
#
# Reqiures:
#   You should probably be on an Enterprise Linux variant. (Centos, RHEL, Scientific, Oracle, Ascendos, et al)
#
# Sample Usage:
#  include server::mysql
#
class server::mysql (
    $db_root_pass = $server::params::db_root_pass,
    $db_name      = $server::params::db_name,
    $db_user      = $server::params::db_user,
    $db_pass      = $server::params::db_pass,
    $db_host      = $server::params::db_host
) inherits server::params {
    #------------------------------------------
    # MySQL
    #------------------------------------------
    class { '::mysql::server':
        root_password => $db_root_pass
    }
    class { '::mysql::bindings':
        php_enable => true
    }

}
