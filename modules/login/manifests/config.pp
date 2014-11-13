#
class { 'login.defs':

  augeas { 'MD5_CRYPT_ENAB':
    context => $::login::params::config_file,
    changes => 'set MD5_CRYPT_ENAB no',
    onylif  => 'match MD5_CRYPT_ENAB not_include no',
  }

  augeas { 'ENCRYPT_METHOD':
    context => $::login::params::config_file,
    changes => 'set ENCRYPT_METHOD SHA512',
    onlyif  => 'match ENCRYPT_METHOD not_include SHA512',
  }
}
