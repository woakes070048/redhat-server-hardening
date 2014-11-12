# == Class: template
#
# Full description of class template here.
#
# === Parameters
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#
class template (
  $package_name = $::template::params::package_name,
  $service_name = $::template::params::service_name,
) inherits ::template::params {

  # validate parameters here

  class { '::template::install': } ->
  class { '::template::config': } ~>
  class { '::template::service': } ->
  Class['::template']
}
