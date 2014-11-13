#
# Module: password
#
# Class: password
#
# Description:
#	This class sets some general password settings, such as appropriate
#	permissions on shadow & passwd, password expiration parameters,
#	password algorithm as sha512, and other maintenance tasks.
#
# Defines:
#       None
#
# LinuxGuide:
#	2.2.3.1
#	2.3.1.4
#	2.3.1.5
#	2.3.1.6
#	2.3.1.7
#	2.3.3.5
#
# CCERef#:
#	CCE-3932-1
#	CCE-3967-7
#	CCE-3883-6
#	CCE-4064-2
#	CCE-4130-1
#	CCE-3495-9
#	CCE-3918-0
#	CCE-3988-3
#	CCE-4210-1
#	CCE-3566-7
#	CCE-3958-6
#	CCE-3276-3
#	CCE-4092-3
#	CCE-4180-6
#	CCE-4154-1
#	CCE-4097-2
#	CCE-3987-5
#	CCE-4238-2
#	CCE-4009-7
#
# Defines:
#	None
#
# File: /etc/puppet/modules/password/manifests/init.pp
#
class password {

) inherits password::params {

# list each above $variable = $networking::params::variable,

# validate_absolute_path($some_path)
# validate_string($some_string)
# validate_bool($some_boolean)
# validate_re($some_regex, ['^\d+$', ''])
# validate_array($some_array)
# if $some_setting { validate_something($variable) }

	class { '::networking::install': } ->
	class { '::networking::config': } ~>
	class { '::networking::service': } ->
	Class['::networking']
}
