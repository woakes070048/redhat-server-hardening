#
class postfix::install {

  package { $::postfix::params::packages:
    ensure => $::postfix::params::ensure
  }
}
