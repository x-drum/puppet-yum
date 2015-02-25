# Class: yum
#
# A class for managing ymu
#
# Parameters:
#
# purge
#    Discard all the unmanaged stanzas, default: present.
#
# Sample Usage:
#
# class { 'yum':
#   purge => true,
# }
#
# Alessio Cassibba (X-Drum) <swapon@gmail.com>
#
# Copyright 2015 Alessio Cassibba (X-Drum), unless otherwise noted.
#
class yum (
  $purge = $yum::params::purge,
) inherits yum::params {

  validate_bool($purge)

  file { "$yum::params::confdir":
    ensure  => 'directory',
    force   => true,
    owner   => root,
    group   => root,
    mode    => '0755',
    purge   => $purge,
    recurse => true,
  }

}
