#
# Module: avahi
#
# Class: avahi
#
# Description:
#    This class disables avahi and removes the corresponding firewall rule.
#
# Defines:
#	None
#
# LinuxGuide:
#	3.7.1.1
#	3.7.1.2
#	2.1.3.1.4
#
# CCERef#:
#	CCE-4365-3
#
class avahi {
	# GuideSection 3.7.1.1
	# CCE-4365-3
	# Disable avahi server
	service {
		"avahi-daemon":
			enable    => false,
			hasstatus => true,
			ensure    => stopped;
	}	
	
	# GuideSection 3.7.1.2
	# Remove firewall rule
	augeas::basic-change { 
		"Avahi-Firewall, 3.7.1.2": 
			file    => "/etc/sysconfig/iptables",
			lens    => "iptables.lns",
			changes => "remove *[append = 'RH-Firewall-1-INPUT']/*[protocol = 'udp'][dport = '5353'][jump = 'ACCEPT']"
        }
}
