# an example profile for mco clients
class profiles::mco_profile::client (
  $middleware_hosts   = $profiles::mco_profile::params::middleware_hosts,
  $ssl_server_cert    = $profiles::mco_profile::params::ssl_server_cert,
  $ssl_server_private = $profiles::mco_profile::params::ssl_server_private,
  $ssl_server_public  = $profiles::mco_profile::params::ssl_server_public,
  $ssl_ca_cert        = $profiles::mco_profile::params::ssl_ca_cert,
  $connector          = $profiles::mco_profile::params::connector,
) {

#  mcollective::user { "${::hostname}_client":
#  mcollective::user { "${::hostname}_kallon":
#  mcollective::user { "${::clientcert}":
  mcollective::user { "kallon":
#    homedir           => '/root',
    certificate       => $ssl_server_cert,
    private_key       => $ssl_server_private,
    ssl_ca_cert       => $ssl_ca_cert,
    ssl_server_public => $ssl_server_public,
    middleware_hosts  => $middleware_hosts,
    middleware_ssl    => true,
    securityprovider  => 'ssl',
    connector         => $connector,
  }

}
