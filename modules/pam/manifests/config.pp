#
class pam::config {

  file { '/etc/pam.conf':
    ensure => file,
    path   => $::pam::params::config_file,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => $::pam::params::config_source,
  }

  pam { 'system-auth/cracklib':
    ensure    => present,
    service   => 'system-auth',
    type      => 'password',
    control   => 'required',
    module    => 'pam_cracklib.so',
    arguments => [
      'try_first_pass',
      'retry=3',
      'minlen=12',
      'dcredit=-1',
      'ucredit=-1',
      'ocredit=-1',
      'lcredit=0', # changed according to desktop settings v. 1.2.5.0
      'difok=3',
    ],
  }

  pam { 'system-auth/tally2':
    ensure  => present,
    service => 'system-auth',
    type    => 'auth',
    control => 'required',
    module  => 'pam_tally2.so',
    arguments => [
      'deny=5',
      'onerr=fail',
    ]
    position => 'before module pam_unix.so',
  }

  pam { 'system-auth/tally2':
    ensure  => present,
    service => 'system-auth',
    type    => 'account',
    control => 'required',
    module  => 'pam_tally2.so',
    position => 'before module pam_unix.so',
  }

  pam { 'system-auth/unix':
    ensure    => present,
    service   => 'system-auth',
    type      => 'password', # changed according to desktop settings v. 1.2.5.0
    control   => 'sufficient', # changed according to desktop settings v. 1.2.5.0
    module    => 'pam_unix.so',
    arguments => [
      'sha512', # from desktop settings v. 1.2.5.0
      'shadow', # from desktop settings v. 1.2.5.0
      'nullok', # from desktop settings v. 1.2.5.0
      'try_first_pass', # from desktop settings v. 1.2.5.0
      'use_authtok', # from desktop settings v. 1.2.5.0
      'existing_options', # from desktop settings v. 1.2.5.0
      'remember=24',
    ],
  }

  # 1.6.1 restrict core dumps
  pam { 'system-auth/limits':
    ensure    => present,
    service   => 'system-auth',
    type      => 'session',
    control   => 'required',
    module    => 'pam_limits.so',
    arguments => '* hard core 0',
  }

  pam { 'system-auth/succeed_if':
    ensure    => absent,
    service   => 'system-auth',
    type      => 'auth',
    control   => 'requisite',
    module    => 'pam_succeed_if.so',
  }

  pam { 'system-auth/deny':
    ensure    => absent,
    service   => 'system-auth',
    type      => 'auth',
    control   => 'required',
    module    => 'pam_deny.so',
  }
