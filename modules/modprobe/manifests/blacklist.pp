#
# namespace:   modprobe::config
# module type: component
# conflicts:   [  ]
# associated:  base::server
# description: manages blacklisting of drivers within modprobe.d
#
class modprobe::blacklist {
  # create the blacklist.conf file based on blacklist
  file { '/etc/modprobe.d/blacklist.conf':
    ensure  => present,
    path    => $::modprobe::params::blacklist_file,
    content => template($::modprobe::params::blacklist_template)
  }

  # blacklist the drivers from being loaded into the kernel
  each($::modprobe::params::blacklist) |$driver| {
    kernel_parameter { 'rdblacklist':
      ensure => present,
      value  => $driver
    }
  }
}
