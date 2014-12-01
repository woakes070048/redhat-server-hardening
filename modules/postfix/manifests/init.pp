#
class postfix inherits postfix::params {

  class { '::postfix::install': } ->
  class { '::postfix::config': } ~>
  class { '::postfix::service': } ->
  Class['::postfix']
}
