$keyfile='/var/named/Kshift.labs.cloud.itisopen.net.*.key'
$key=inline_template('<%=File.read(Dir.glob(keyfile)[0]).strip.split(\' \')[7]%>')
class { 'openshift_origin' :
#  node_fqdn                  => "${hostname}.${domain}",
  node_fqdn                  => "ec2-54-216-34-138.eu-west-1.compute.amazonaws.com",
  node_public_ip             => "54.216.34.138",
  cloud_domain               => 'shift.labs.cloud.itisopen.net',
  named_tsig_priv_key        => $::key,
  dns_servers                => ['172.16.0.23'],
  os_unmanaged_users         => ['itisopen'],
  enable_network_services    => true,
  configure_firewall         => true,
  configure_ntp              => true,
  configure_activemq         => true,
  configure_qpid             => false,
  configure_mongodb          => true,
  configure_named            => true,
  configure_broker           => true,
  configure_console          => true,
  configure_node             => true,
  development_mode           => true,
}
