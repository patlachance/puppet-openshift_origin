PUPPET=/usr/bin/puppet
sudo $PUPPET apply --verbose ./manifests/init.pp
sudo $PUPPET apply --verbose ./manifests/configure.pp
