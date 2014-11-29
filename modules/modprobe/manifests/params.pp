#
# namespace:   modprobe::params
# module type: component
# conflicts:   [  ]
# associated:  base::server
# description: manages module parameters
#
class modprobe::params {

  $blacklist_template     = "/${module_name}/blacklist.conf.erb"
  $default_blacklist_file = '/etc/modprobe.d/blacklist.conf'

  case $::osfamily {
    'RedHat': {
      $blacklist = [
        'ath',            # Red Hat CVE-2014-2672
        'ath9k',          # Red Hat CVE-2014-2672
        'cramfs',         # USGCB
        'freevxfs',       # USGCB
        'jffs2',          # USGCB
        'hfs',            # USGCB
        'hfsplus',        # USGCB
        'udf',            # USGCB
        'usb-storage',    # USGCB
        'ipv6',           # USGCB
        'bluetooth',      # USGCB
        'net-pf-31',      # USGCB
        'dccp',           # USGCB
        'sctp',           # USGCB
        'rds',            # USGCB
        'tipc'            # USGCB
        'i8xx_tco',       # Red Hat
        'aty128fb',       # Red Hat
        'atyfb',          # Red Hat
        'radeonfb',       # Red Hat
        'i810fb',         # Red Hat
        'cirrusfb',       # Red Hat
        'intelfb',        # Red Hat
        'kyrofb',         # Red Hat
        'i2c-matroxfb',   # Red Hat
        'hgafb',          # Red Hat
        'nvidiafb',       # Red Hat
        'rivafb',         # Red Hat
        'savagefb',       # Red Hat
        'sstfb',          # Red Hat
        'neofb',          # Red Hat
        'tridentfb',      # Red Hat
        'tdfxfb',         # Red Hat
        'virgefb',        # Red Hat
        'vga16fb',        # Red Hat
        'viafb',          # Red Hat
        'hisax',          # Red Hat
        'hisax_fcpcipnp', # Red Hat
        'snd-pcsp',       # Red Hat
        'chsc_sch'        # Red Hat
      ]

      $blacklist_file = $default_blacklist_file
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }

  validate_array($blacklist)
  validate_absolute_path($blacklist_template)
  validate_absolute_path($blacklist_file)
}
