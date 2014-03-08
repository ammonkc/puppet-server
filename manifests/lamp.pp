# Class server::lamp
#
# Actions:
#   Configure a LAMP server
#
# Reqiures:
#   You should probably be on an Enterprise Linux variant. (Centos, RHEL, Scientific, Oracle, Ascendos, et al)
#
# Sample Usage:
#  include server::lamp
#
class server::lamp (
    $httpd    = true,
    $php      = true,
    $mysql    = true,
    $nodejs   = true,
) {
    if $httpd == true {
        include server::httpd
    }

    if $php == true {
        include server::php
    }

    if $mysql == true {
        include server::mysql
        if $mysql_db != undef {
            include server::mysql::db
        }
    }
}
