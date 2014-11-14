# == Class nfs::config
#
# Disables global write to /home directory.
#
class nfs::config {
  file { '/home':
    mode         => '0700',
    recurse      => true,
    recurselimit => '1',
    ignore       => '/home';
  }

  exec { '/home mode':
    command => 'chmod 755 /home',
    user    => 'root',
    require => File['/home'],
  }
}
