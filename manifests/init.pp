# == Class: squeezeboxserver
#
# Full description of class squeezeboxserver here.
#
# === Parameters
#
# [*install_mode*]
#   Whether to install from VCS, downloaded package, or package repository.
#   * vcs     = install from Version Control System checkout
#   * package = install from downloaded package
#   * repo    = install from package repository
#   Default = vcs
#
# [*install_vcsprovider*]
#   What kind of version control system provider. Default = git
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the function of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { squeezeboxserver:
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Robert Moser II <rlmoser@gmail.com>
#
# === Copyright
#
# Copyright 2015 Robert Moser II
#
class squeezeboxserver {


}
