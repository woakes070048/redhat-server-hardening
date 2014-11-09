# Class: postfix
#
# Description: 
#	Ensures the postfix mail service is installed and properly configured.
#
# Guide Reference:
#	3.11.1.1
#
# CCE Reference:
#	TBD
#
class postfix {
	# Guide Section 3.11.1.1
	# Install postfix
	
	package {
		"postfix":
			ensure    => installed;
	}

	# Disable network listening
	augeas {
		"postfix-network-listening":
			context => "/files/etc/postfix/main.cf",
			changes => "set inet_interfaces localhost",
			onlyif => "get inet_interfaces != localhost",
	}
}
