## This module manages yum repositories stanzas.
That's it: Yet another yum module to manage yum repositories stanzas.

## Class: yum
Used to manage yum configuration (currently only a stub).

### Parameters:
*purge:*  
  Discard all the unmanaged stanzas, default: present.

### Sample Usage:
 ```puppet
 class { 'yum':
   purge => true,
 }
 ```
## Resource: yum::repo

A resource for managing yum repositories stanzas

### Parameters:
 *description:*  
   Repository description.

 *enabled:*  
   Whether this repository is enabled., default: true.

 *gpgcheck:*  
   Whether to check the GPG signature on packages, default: false.

 *gpgkey:*  
   The URL for the GPG key, default: undef.

 *mirrorlist:*  
    The URL for the GPG key for this repository, default: absent.

 *exclude:*  
   Matching packages will never be considered in updates or installs for this repo, default: absent.

 *includepkgs:*  
  Only packages matching one of the shell globs will be considered for update or install, default: absent.

 *priority:*  
   Priority of this repository from 1-99, default: absent.

 *proxy:*  
   URL of a proxy server that Yum should use, default: absent.

 *proxy_username:*  
   Username for this proxy.
 
 *proxy_password:*  
   Password for this proxy.

 *ensure:*  
   Specify if this stanza should be present or not, default: present

### Sample Usage:
```
 yum::repo { "centos-base":
   description => 'CentOS Base',
   mirrorlist  => 'http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=os&infra=$infra',
   gpgcheck    => true,
   gpgkey      => "http://mirror.centos.org/centos/RPM-GPG-KEY-CentOS-6",
 }
```

### Copyright:
Copyright 2015 Alessio Cassibba (X-Drum), unless otherwise noted.
