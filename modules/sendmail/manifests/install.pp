# == Class: sendmail::install
#
class sendmail::install {

  package { $::sendmail::params::packages:
    ensure => $::sendmail::params::ensure
  }
}
