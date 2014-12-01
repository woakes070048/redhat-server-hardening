#
class postfix {

	package { 'postfix':
		ensure => present
	}

	# 3.16 configure mail transfer agent for local-only mode
	augeas { 'block usb-storage':
		context => '/files/etc/modprobe.d/blacklist.conf/',
		changes => 'set inet_interfaces[last()+1] localhost',
		onlyif  => "match inet_interfaces[.='localhost'] size == 0"
	}
}
