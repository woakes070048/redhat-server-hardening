class password::config {

  file { '/etc/passwd':
    owner => 'root',
    group => 'root',
    mode  => '0644',
  }

  file { '/etc/group':
    owner => 'root',
    group => 'root',
    mode  => '0644',
  }

  file { '/etc/shadow':
    owner => 'root',
    group => 'root',
    mode  => '0400',
  }

  file { '/etc/gshadow':
    owner => 'root',
    group => 'root',
    mode  => '0400',
  }

  file { '/etc/libuser.conf':
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template($::password::params::libuser_template),
  }

  augeas { 'PASS_MIN_DAYS':
    context => $::login::params::login_config,
    lens    => 'login_defs',
    changes => 'set PASS_MIN_DAYS 1',
    onlyif  => 'PASS_MIN_DAYS != 1',
  }

  augeas { 'PASS_WARN_AGE':
    context => $::login::params::login_config,
    lens    => 'login_defs',
    changes => 'set PASS_WARN_AGE 14',
    onlyif  => 'PASS_WARN_AGE != 14',
  }

  augeas { 'PASS_MAX_DAYS':
    context => $::login::params::login_config,
    lens    => 'login_defs',
    changes => 'set PASS_MAX_DAYS 60',
    onlyif  => 'PASS_MAX_DAYS != 60',
  }

  augeas { 'PASS_MIN_LEN':
    context => $::login::params::login_config,
    lens    => 'login_defs',
    changes => 'set PASS_MIN_LEN 12',
    onlyif  => 'PASS_MIN_LEN != 12',
  }

  # GuideSection 2.3.1.5
  # Verify that no accounts have empty Password Fields
  exec { "/bin/awk -F: '(\$2 == \"\") {print}' /etc/shadow":
    user      => 'root',
    logoutput => true,
  }

  # GuideSection 2.3.1.6
  # Verify that No Non-Root Accounts Have UID 0
  exec { "/bin/awk -F: '(\$3 == \"0\" && \$1 !=\"root\") {print}' /etc/passwd":
    user      => 'root',
    logoutput => true,
  }

  # GuideSection 2.3.1.4
  # Block Shell and Login Access for Non-Root System Accounts
  file { '/etc/puppet/scripts':
    ensure => 'directory',
    owner  => 'root',
    group  => 'root',
    mode   => '0700',
  }

  file { '/etc/puppet/scripts/checkUsers.bash':
    owner => 'root',
    group => 'root',
    mode  => '0700',
    source => $::password::params::checkusers_source,
  }

  exec { '/etc/puppet/scripts/checkUsers.bash':
    user      => 'root',
    logoutput => true,
    require   => File["/etc/puppet/scripts/checkUsers.bash"];
  }
}
