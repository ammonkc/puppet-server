# Class server::node-js
#
# Actions:
#   Configure a Node.js
#
# Reqiures:
#   You should probably be on an Enterprise Linux variant. (Centos, RHEL, Scientific, Oracle, Ascendos, et al)
#
# Sample Usage:
#  include server::node-js
#
class server::node-js {
    #------------------------------------------
    # Node.js
    #------------------------------------------
    # Nodejs module - Install node.js
    include nodejs

    #------------------------------------------
    # npm packages
    #------------------------------------------
    $node_pkgs = [
        'less'
    ]
    package { $node_pkgs:
      ensure   => present,
      provider => 'npm',
    }
}
