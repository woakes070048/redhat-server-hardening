#
# namespace:   modprobe
# module type: component
# conflicts:   [  ]
# associated:  base::server
# description: manages init of modprobe classes
#
class modprobe (

) inherits modprobe::params {

  class { '::modprobe::blacklist': } ->
  Class['::modprobe']
}
