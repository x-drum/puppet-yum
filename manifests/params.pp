# Class: yum::params
#
# A class for managing yum
#
# Parameters:
#
# Alessio Cassibba (X-Drum) <swapon@gmail.com>
#
# Copyright 2015 Alessio Cassibba (X-Drum), unless otherwise noted.
#
class yum::params {
  case $::osfamily {
    'RedHat': {
      $confdir = "/etc/yum.repos.d"
      $purge   = false
    }
    default: {
      fail("${::osfamily} not supported")
    }
  }
}
