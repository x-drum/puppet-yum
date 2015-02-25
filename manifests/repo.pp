# Define: yum::repo
#
# A resource for managing yum stanzas
#
# Parameters:
#  baseurl
#    The URL for the for this repository, default: absent.
#
#  description
#    Repository description.
#
#  enabled:
#    Whether this repository is enabled., default: true.
#
#  gpgcheck:
#    Whether to check the GPG signature on packages, default: false.
#
#  gpgkey: 
#    The URL for the GPG key, default: undef.
#
#  mirrorlist:
#     The URL for the for this repository, default: absent.
#
#  exclude:
#    Matching packages will never be considered in updates or installs for this repo, default: absent.
#
#  includepkgs:
#   Only packages matching one of the shell globs will be considered for update or install, default: absent.
#
#  priority:
#    Priority of this repository from 1-99, default: absent.
#
#  proxy:
#    URL of a proxy server that Yum should use, default: absent.
#
#  proxy_username:
#    Username for this proxy.
#  
#  proxy_password:
#    Password for this proxy.
#
#  ensure:
#    Specify if this stanza should be present or not, default: present
#
# Sample Usage:
#
#  yum::repo { "centos-base":
#    description => 'CentOS Base',
#    mirrorlist  => 'http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=os&infra=$infra',
#    gpgcheck    => true,
#    gpgkey      => "http://mirror.centos.org/centos/RPM-GPG-KEY-CentOS-6",
#  }
#
# Alessio Cassibba (X-Drum) <swapon@gmail.com>
#
# Copyright 2015 Alessio Cassibba (X-Drum), unless otherwise noted.
#
define yum::repo (
  $baseurl        = absent,
  $description    = undef,
  $enabled        = true,
  $ensure         = present,
  $exclude        = absent,
  $gpgcheck       = false,
  $gpgkey         = undef,
  $includepkgs    = absent,
  $mirrorlist     = absent,
  $priority       = absent,
  $proxy          = absent,
  $proxy_password = absent,
  $proxy_username = absent,
){
  include yum

  if $gpgcheck {
  	validate_string($gpgkey)
  	if ! $gpgkey and $gpgkey == undef {
  		fail("specify a valid url for gpgkey")
  	}
  }

  yumrepo { $name:
    baseurl        => $baseurl,
    descr          => $description,
    enabled        => $enabled,
    ensure         => $ensure,
    exclude        => $exclude,
    gpgcheck       => $gpgcheck,
    gpgkey         => $gpgkey,
    includepkgs    => $includepkgs,
    mirrorlist     => $mirrorlist,
    priority       => $priority,
    proxy          => $proxy,
    proxy_username => $proxy_username,
    proxy_password => $proxy_password,
    require        => File["/etc/yum.repos.d"],
  }
}