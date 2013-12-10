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
    $enabled    = true,
) {
    #------------------------------------------
    # MySQL
    #------------------------------------------
    class { '::mysql::server':
        root_password => 'Dbr00+'
    }
    class { '::mysql::bindings':
        php_enable => true
    }
    mysql::db { "vagrant":
        user        => "vagrant",
        password    => "vagrantDbr00+",
        host        => 'localhost',
        grant       => ['SELECT', 'INSERT', 'UPDATE', 'DELETE', 'CREATE', 'DROP', 'ALTER', 'EXECUTE'],
        # sql         => "/var/www/html/${fqdn}/app/database/${mysql_db}.sql"
    }

}
