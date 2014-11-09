#
# Module: auditd
#
# Class: auditd
#
# Description:
# 	This class configures the auditd daemon on a system
#
# Defines:
# 	None
#
# LinuxGuide:
# 	2.6.2.1
# 	2.6.2.3
# 	2.6.2.4
# 	2.6.2.4.1
# 	2.6.2.4.2
# 	2.6.2.4.3
# 	2.6.2.4.4
# 	2.6.2.4.5
# 	2.6.2.4.6
# 	2.6.2.4.7
# 	2.6.2.4.8
# 	2.6.2.4.9
# 	2.6.2.4.10
# 	2.6.2.4.11
# 	2.6.2.4.12
# 	2.6.2.4.13
#
# CCERef#:
# 	CCE-4292-9
#
# Variables:
# 	None
#
# Facts:
# 	$architecture Used to pull the appropiate rules for the system
#
# TODO:
# 	1. Would be nice to turn this into a type, so rules can be 
# 	added easier on the fly.
# 	2. We dont edit/look at auditd.conf file maybe we should?
class auditd {
	# GuideSection 2.6.2.1
	# CCE-4292-9
	# Enables the auditd service
	package {
		[audit]:
		ensure => installed;
	}
	
	service {
		"auditd":
			enable     => true,
			ensure     => running,
			hasstatus  => true,
			hasrestart => true,
			require    => Package["audit"],
	}

	# GuideSection 2.6.2.4.*
	# Configure default comprehensive rules
	file {
                "/etc/audit/audit.rules":
                owner   => "root",
                group   => "root",
                mode    => 600,
		source  => $architecture? { 
                	x64     => "puppet:///modules/auditd/audit.rules.64",
			default => "puppet:///modules/auditd/audit.rules.386",
		},
		require => Package["audit"],
		notify  => Service["auditd"], 
        }

	# GuideSection 2.6.2.3
	# Enable audit prior to daemon
	exec {
		"AuditBoot, 2.6.2.3":
			command => "/bin/sed -i 's/quiet/quiet audit=1/g' /boot/grub/grub.conf",
			onlyif  => "/usr/bin/test `grep audit /boot/grub/grub.conf |wc -l` -eq 0",
			user    => "root",
			require => Package["audit"],
	}
}
