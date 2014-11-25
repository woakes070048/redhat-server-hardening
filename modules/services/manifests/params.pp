## == Class: services::params
#
# See 'modules/puppet' documentation for more
# information on module parameters.
#
# == About: this module
#
# module type:
#   component
#
# conflicts with:
#   [  ]
#
# associated profiles/stacks:
#   'base::server'
#
# == About: this class
#
# description:
#   manages configuration of this module via parameters
#
class services::params {

  case $::osfamily {
    'RedHat': {
      $packages_absent = [
      'dhcp',
      'dns',
      'dovecot',
      'gnome-user-share',
      'httpd',
      'inetd',
      'ipsec-tools',
      'irda-utils',
      'isdn4k-utils',
      'krb5-workstation',
      'net-snmp',
      'rsh-server',
      'rsh',
      'squid',
      'talk',
      'telnet',
      'telnet-server',
      'tftp-server',
      'vsftpd',
      'xinetd',
      'ypserv'
      ]
      $services_absent_hasstatus = [
        'cups',
        'dhcpd',
        'haldaemon',
        'hplip',
        'httpd',
        'inetd',
        'irqbalance',
        'kdump',
        'mdmonitor',
        'pcscd',
        'rhnsd',
        'snmpd',
        'smb',
        'squid',
        'vsftpd',
        'xfs',
        'xinetd',
        'ypbind',
        'anacron'
      ]
      $services_absent = [
        'apmd'
        'bluetooth'
        'dns'
        'dovecot'
        'firstboot'
        'hidd'
        'irda'
        'isdn'
        'kudzu'
        'messagebus'
        'microcode_ctl'
        'rawdevices'
        'readahead_early'
        'readahead_later'
      ]
      $present_hasstatus = [
        'acpid',
        'restorecond',
        'smartd'
      ]
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }

  validate_array($packages_absent)
  validate_array($services_absent_hasstatus)
  validate_array($services_absent)
  validate_array($present_hasstatus)

}
