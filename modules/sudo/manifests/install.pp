# == Class sudo::install
#
# This class is meant to be called from sudo
# It ensures any core components of sudo are installed
#
class sudo::install {

  group { 'wheel':
    ensure => $::sudo::params::wheel_ensure,
  }
}
