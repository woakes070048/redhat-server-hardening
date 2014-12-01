#
class postfix::config {

  # 3.16 configure mail transfer agent for local-only mode
  augeas { 'local-only mode':
    context => $::postfix::params::config_file,
    changes => 'set inet_interfaces[last()+1] localhost',
    onlyif  => "match inet_interfaces[.='localhost'] size == 0"
  }
}
