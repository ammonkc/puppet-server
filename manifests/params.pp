# Optional parameters in setting up your server
class server::params {
    # httpd params
    $server_name    = $fqdn
    $docroot        = "/var/www/html/${fqdn}/public"
    $dir_options    = "-Indexes -Includes -FollowSymLinks SymLinksifOwnerMatch ExecCGI MultiViews"
    $dir_override   = "All"

    # mysql params
    $db_root_pass = 'Dbr00+'
    $db_name      = 'vagrant'
    $db_user      = 'vagrant'
    $db_pass      = 'vagrantDbr00+'
    $db_sql       = false
    $db_host      = 'localhost'

    # Composer params
    $comp_phar_location = 'http://getcomposer.org/composer.phar'
    $comp_target_dir    = '/usr/local/bin'
    $comp_command_name  = 'composer'
    $comp_user          = 'root'
}
