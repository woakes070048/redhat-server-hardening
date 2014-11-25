# == Class: services::service
#
# See 'modules/puppet' documentation for more
# information on module parameters.
#
# == About: this module
#
# module type:
# component
#
# conflicts with:
# []
#
# associated profiles/stacks:
# 'base::server'
#
# == About: this class
#
# description:
# ensures unused services are stopped as appropriate
#
class services::service {

  service { $::services::params::services_present_hasstatus:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true
  }

  # disable unecessary core services
  service { $::services::params::services_absent_hasstatus:
    ensure    => false,
    enable    => false,
    hasstatus => true
  }

  service { $::services::params::services_absent:
    ensure    => false,
    enable    => false
  }
}
