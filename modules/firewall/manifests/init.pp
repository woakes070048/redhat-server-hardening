# == module: firewall
#
# Description:
#	This class configures base firewall rules via iptables.
#	For configuring iptables specifically, see the iptables module.
#
# LinuxGuide:
# 2.5.5.1
#	2.5.5.3.1
#
# CCERef#:
# CCE-4189-7
#
class firewall (

) inherits firewall::params {

	class { '::firewall::pre': } ->
	class { '::firewall::rules': } ->
	class { '::firewall::post': } ->
	Class['::firewall']
}

	# Configure iptables added rules to /etc/sysconfig/iptables

	# Note: iptables puts these rules in alphabetical order by name,
	# so prefix with numbers if order is important

	# ICMP Rules




	# pre.iptables and post.iptable files
	# This overcomes the sorting problem for the final drop rule
	file {
		"/etc/puppet/post.iptables":
			content => "-A INPUT -j DROP\n-A FORWARD -j DROP",
			mode => 0600,
	}


}
