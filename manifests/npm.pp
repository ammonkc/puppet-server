# Class server::npm
#
# Actions:
#   install npm packages
#
# Reqiures:
#   You should probably be on an Enterprise Linux variant. (Centos, RHEL, Scientific, Oracle, Ascendos, et al)
#
# Sample Usage:
#  include server::npm
#
class server::npm {
    #------------------------------------------
    # npm packages
    #------------------------------------------
    $node_pkgs = [
        'less'
    ]
    package { $node_pkgs:
        ensure   => present,
        provider => 'npm',
        require  => Package['nodejs']
    }
}
