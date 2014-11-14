class firewall::rules {
  firewall { '000 allow icmp echo reply':
    proto  => 'icmp',
    icmp   => '0',
    action => 'ACCEPT',
  }

  firewall { '000 allow icmp destination unreachable':
    proto => 'icmp',
    icmp => 3,
    action => 'ACCEPT',
  }

  firewall { '000 allow icmp time exceeded':
    proto => 'icmp',
    icmp  => 11,
    action  => 'ACCEPT',
  }

  # Explicitly allow/drop certain incoming connections
  firewall { '0 allow loopback':
      iniface => 'lo',
      action => 'ACCEPT',
  }

  #	firewall {
   '000 drop avahi (mDNS)':
  #			proto => 'udp',
  #			dport => '5353',
  #			destination => '224.0.0.251',
  #			action => 'DROP',
  #	}

  firewall { '000 allow stablished states':
      state => 'ESTABLISHED',
      action => 'ACCEPT',
  }

  firewall {
  '000 allow related states':
      state => 'RELATED',
      action => 'ACCEPT',
  }

  # Logging
  firewall {
  '800 log c ss A spoofing attempt':
      iniface => 'eth0',
      source => '10.0.0.0/8',
      action => 'LOG',
      log_prefix => 'IP DROP SPOOF A: ',
  }

  firewall {
  '800 log class B spoofing attempt':
      iniface => 'eth0',
      source => '172.16.0.0/12',
      action => 'LOG',
      log_prefix => 'IP DROP SPOOF B: ',
  }

  firewall { '800 log class C spoofing attempt':
      iniface => 'eth0',
      source => '192.168.0.0/16',
      action => 'LOG',
      log_prefix => 'IP DROP SPOOF C: ',
  }

  firewall { '800 log multicast spoofing attempt':
      iniface => 'eth0',
      source => '224.0.0.0/4',
      action => 'LOG',
      log_prefix => 'IP DROP MULTICAST D: ',
  }

  firewall { '800 log spoofing E attempt':
      iniface => 'eth0',
      source => '240.0.0.0/5',
      action => 'LOG',
      log_prefix => 'IP DROP SPOOF E: ',
  }

  firewall { '800 log loopback spoofing attempt':
      iniface => 'eth0',
      destination => '127.0.0.0/8',
      action => 'LOG',
      log_prefix => 'IP DROP LOOPBACK: ',
  }

  firewall { '801 log all other incoming packets before they get dropped':
      action => 'LOG',
      log_prefix => 'IP INPUT DROP: ',
  }

  # Explicitly DROP anything that is not matched
  #firewall {
 	'zzz drop everything from input chain':
  #			action => 'DROP',
  #	}
  #	firewall {
   'zzz drop everything from forward chain':
  #			chain => 'FORWARD',
  #			action => 'DROP',
  #	}
}
