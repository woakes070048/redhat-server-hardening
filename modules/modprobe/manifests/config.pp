# == Class modprobe::config
#
# This class is called from modprobe
#
class modprobe::config {

  kernel_parameter { 'cramfs':
    ensure => absent,
  }

  kernel_parameter { 'freevxfs':
    ensure => absent,
  }

  kernel_parameter { 'jffs2':
    ensure => absent,
  }

  kernel_parameter { 'hfs':
    ensure => absent,
  }

  kernel_parameter { 'hfsplus':
    ensure => absent,
  }

  kernel_parameter { 'udf':
    ensure => absent,
  }

  kernel_parameter { 'usb-storage':
    ensure => absent,
  }

  kernel_parameter { 'ipv6':
    ensure => absent,
  }

  kernel_parameter { 'bluetooth':
    ensure => absent,
  }

  kernel_parameter { 'net-pf-31':
    ensure => absent,
  }

  kernel_parameter { 'dccp':
    ensure => absent,
  }

  kernel_parameter { 'sctp':
    ensure => absent,
  }

  kernel_parameter { 'rds':
    ensure => absent,
  }

  kernel_parameter { 'tipc':
    ensure => absent,
  }
}
