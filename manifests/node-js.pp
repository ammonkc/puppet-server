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
class server::node-js (
    $enabled    = true,
) {
    #------------------------------------------
    # Node.js
    #------------------------------------------
    info("Installing Node.js")
    # Nodejs module - Install node.js
    # register run stages
    # class { 'nodejs': stage => pre-node; }
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
