# Class server::mysql::db
#
# Actions:
#   Create a MySQL Database
#
# Reqiures:
#   You should probably be on an Enterprise Linux variant. (Centos, RHEL, Scientific, Oracle, Ascendos, et al)
#
# Sample Usage:
#  include server::mysql
#
class server::mysql::db (
    $db_name      = $mysql_db ? {
        undef   => $server::params::db_name,
        default => $mysql_db,
    },
    $db_user      = $mysql_user ? {
        undef   => $server::params::db_user,
        default => $mysql_user,
    },
    $db_pass      = $mysql_pass ? {
        undef   => $server::params::db_pass,
        default => $mysql_pass,
    },
    $db_sql       = $mysql_sql ? {
        undef   => $server::params::db_sql,
        default => $mysql_sql,
    },
    $db_host      = $server::params::db_host
) inherits server::params {
    if $db_sql != false {
        $sqlfile = "/vagrant/${db_sql}.sql"

        mysql::db { "${db_name}":
            user        => $db_user,
            password    => $db_pass,
            host        => $db_host,
            grant       => ['SELECT', 'INSERT', 'UPDATE', 'DELETE', 'CREATE', 'DROP', 'ALTER', 'EXECUTE'],
            sql         => $sqlfile,
        }
    }
    else {
        mysql::db { "${db_name}":
            user        => $db_user,
            password    => $db_pass,
            host        => $db_host,
            grant       => ['SELECT', 'INSERT', 'UPDATE', 'DELETE', 'CREATE', 'DROP', 'ALTER', 'EXECUTE'],
        }
    }

}
