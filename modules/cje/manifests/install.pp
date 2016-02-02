# == Class: cje::install
#
# Full description of class cje here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { cje:
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Thomas A. McGonagle <tmcgongle@cloudbees.com>
#
# === Copyright
#
# Copyright 2016 Your name here, unless otherwise noted.
#
class cje::install inherits cje {

  # for debug output on the puppet master
  notice("Running inside cje::install ")

  # for debug output on the puppet client
  notify {"Running inside cje::install ": }

  yumrepo {'jenkins':
     descr    => 'CloudBees Enterprise Jenkins',
     baseurl  => "${install_baseurl}", 
     gpgcheck => 1,
     gpgkey   => "${install_gpgkey}",
     enabled  => 1,
   }

  package {'jenkins':
     ensure   => "${install_version}",
     require  => Yumrepo["jenkins"]
  }

}
