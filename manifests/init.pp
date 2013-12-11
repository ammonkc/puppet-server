##############################################################################
# Configure Server
##############################################################################

class server (
    $server_name        = params_lookup( 'server_name' ),
    $docroot            = params_lookup( 'docroot' ),
    $dir_options        = params_lookup( 'dir_options' ),
    $dir_override       = params_lookup( 'dir_override' ),
    $db_root_pass       = params_lookup( 'db_root_pass' ),
    $db_name            = params_lookup( 'db_name' ),
    $db_user            = params_lookup( 'db_user' ),
    $db_pass            = params_lookup( 'db_pass' ),
    $db_host            = params_lookup( 'db_host' ),
    $comp_phar_location = params_lookup( 'comp_phar_location' ),
    $comp_target_dir    = params_lookup( 'comp_target_dir' ),
    $comp_command_name  = params_lookup( 'comp_command_name' ),
    $comp_user          = params_lookup( 'comp_user' )
) inherits server::params {

}

