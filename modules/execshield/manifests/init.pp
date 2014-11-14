# == Class: execshield
#
# Installs and configures execshield according to USGCB best practices
#
# LinuxGuide:
# 2.2.4.3
#
# CCERef#:
# CCE-4168-1
#	CCE-4146-7
#
class execshield (

) inherits execshield::params {

  class { '::execshield::config': } ~>
  Class['::execshield']
}
