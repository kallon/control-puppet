# This class should be applied to all servers, and sets up the MCollective
# server. It includes its parent class "site" and uses the parameters set
# there. Inheritance is used to ensure order of evaluation and exposition of
# parameters without needing to call "include".
#
# The default parameters come from the profiles::mco_profile::params class for only one
# reason. It allows the user to OPTIONALLY use Hiera to set values in one place
# and have them propagate multiple related classes. This will only work if the
# parameters are set in Hiera. It will not work if the parameters are set from
# an ENC.
#
class profiles::mco_profile::server (
  $client              = $profiles::mco_profile::params::client,
  $client_loglevel     = $profiles::mco_profile::params::client_loglevel,
  $server_loglevel     = $profiles::mco_profile::params::server_loglevel,
  $middleware_hosts    = $profiles::mco_profile::params::middleware_hosts,
  $middleware_ssl_port = $profiles::mco_profile::params::middleware_ssl_port,
  $middleware_user     = $profiles::mco_profile::params::middleware_user,
  $middleware_password = $profiles::mco_profile::params::middleware_password,
  $main_collective     = $profiles::mco_profile::params::main_collective,
  $collectives         = $profiles::mco_profile::params::collectives,
  $connector           = $profiles::mco_profile::params::connector,
  $ssl_server_cert     = $profiles::mco_profile::params::ssl_server_cert,
  $ssl_server_private  = $profiles::mco_profile::params::ssl_server_private,
  $ssl_ca_cert         = $profiles::mco_profile::params::ssl_ca_cert,
  $server_logfile      = $profiles::mco_profile::params::server_logfile,
) inherits profiles::mco_profile::params {

  class { '::mcollective':
    client              => $client,
    client_loglevel     => $client_loglevel,
    server_loglevel     => $server_loglevel,
    securityprovider    => 'ssl',
    middleware_ssl      => true,
    middleware_hosts    => $middleware_hosts,
    middleware_ssl_port => $middleware_ssl_port,
    middleware_user     => $middleware_user,
    middleware_password => $middleware_password,
    main_collective     => $main_collective,
    collectives         => $collectives,
    connector           => $connector,
    #ssl_client_certs    => 'puppet:///modules/mco_profile/client_certs',
    ssl_client_certs    => 'puppet:///modules/profiles/mco_profile/client_certs',
    ssl_server_public   => $ssl_server_cert,
    ssl_server_private  => $ssl_server_private,
    ssl_ca_cert         => $ssl_ca_cert,
    server_logfile      => $server_logfile,
  }

  # Add authorized client users's certificates to the files/client_certs in this module.
  # And it will be distributed to every MCollective server for client access authentication usage

}
