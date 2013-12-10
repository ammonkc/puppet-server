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
    $enabled    = true,
) {
    include server::httpd
    include server::php
    include server::mysql
}
