# == Class module::config
#
# This class is called from module
#
class module::config {

  autofs::include { 'auto.local': }

  autofs::mount { '/dev/cdrom':
    map     => 'cdrom',
    options => '-fstype=iso9660,ro,sync,nodev,nosuid',
    mapfile => '/etc/auto.local',
  }

  autofs::include { 'auto.local': }

  autofs::mount { '/dev/cdrom':
    map     => 'cdrom',
    options => '-fstype=iso9660,ro,sync,nodev,nosuid',
    mapfile => '/etc/auto.local',
  }

  autofs::include { 'auto.local': }

  autofs::mount { '/dev/floppy':
    map     => 'cdrom',
    options => '-fstype=iso9660,ro,sync,nodev,nosuid',
    mapfile => '/etc/auto.local',
  }

  autofs::include { 'auto.local': }

  autofs::mount { '/dev/usb':
    map     => 'cdrom',
    options => '-fstype=iso9660,ro,sync,nodev,nosuid',
    mapfile => '/etc/auto.local',
  }
}
