##############################################################################
# Configure Server
##############################################################################

class server (
    $server_name        = $server::params::server_name,
    $docroot            = $server::params::docroot,
    $dir_options        = $server::params::dir_options,
    $dir_override       = $server::params::dir_override,
    $db_root_pass       = $server::params::db_root_pass,
    $db_name            = $server::params::db_name,
    $db_user            = $server::params::db_user,
    $db_pass            = $server::params::db_pass,
    $db_host            = $server::params::db_host,
    $comp_phar_location = $server::params::comp_phar_location,
    $comp_target_dir    = $server::params::comp_target_dir,
    $comp_command_name  = $server::params::comp_command_name,
    $comp_user          = $server::params::comp_user
) inherits server::params {

}

