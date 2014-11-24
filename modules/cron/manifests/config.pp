# == Class: cron::config
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
#   manages structure and content of cron configuration
#
class cron::config {

  file { '/etc/crontab':
    owner => 'root',
    group => 'root',
    mode  => '0600';

  file { '/etc/anacrontab':
    owner => 'root',
    group => 'root',
    mode  => '0600';

  file { '/etc/cron.hourly':
    owner => 'root',
    group => 'root',
    mode  => '0700';

  file { '/etc/cron.daily':
    owner => 'root',
    group => 'root',
    mode  => '0700';

  file { '/etc/cron.weekly':
    owner => 'root',
    group => 'root',
    mode  => '0700';

  file { '/etc/cron.monthly':
    owner => 'root',
    group => 'root',
    mode  => '0700';

  file { '/etc/cron.d':
    owner => 'root',
    group => 'root',
    mode  => '0700';

  file { '/var/spool/cron':
    owner => 'root',
    group => 'root',
    mode  => '0600';
  }
}
