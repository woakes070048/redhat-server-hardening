#
class ldap::config {

  # possibly absent from v1.3.0 / 05-06-2014 CIS RHEL6 Benchmark
  augeas { 'tls checkpeer':
    context => '/files/etc/ldap.conf/',
    changes => 'set tls_checkpeer[last()+1] yes',
    onlyif  => "match tls_checkpeer[.='yes'] size == 0"
  }
}
