The [USGCB Security RHEL5 Server Configuration Baseline](http://usgcb.nist.gov/usgcb_faq.html) is an excellent resource for Red Hat sysadmins. The baseline itself is an excellent tool for providing IT shops of all sizes with an effective resource for performing server hardening. Security baselines keep the bad guys out, and allow sysadmins to concentrate more effectively on the security issues inherently unique to their organization.

How could that get any better? Oh, by writing the configurations into Puppet code so they're automatically available for mass implementation. The configurations are available from the USGCB website as a series of [puppet modules](http://usgcb.nist.gov/usgcb/rhel/download_rhel5.html) created by the DOD).

A surprisingly modern approach taken by the federal government this time. Seriously, +2 cool points DOD.

With that said, some of the manifests however, **do not** appear to be consistent with the specifications discussed in the Puppet Labs official style guide. Therefore, as a learning experience and a nod towards an already excellent idea, I will be restructuring and updating the constituent manifests of the baseline in order to bring them more in line with the current style guidelines.

The entire USGCB module package will be initially committed in order to more clearly show the changes made to bring the contents both more in line for the current version of the [Puppet Labs style guide](https://docs.puppetlabs.com/guides/style_guide.html)

## Original README

The purpose of these Puppet manifests and kickstart file is to assist system
administrators deploying the United States Government Configuration Baseline
(USGCB) for Red Hat Enterprise Linux 5. These were created by NSA SNAC to
support adoption of USGCB settings.

Puppet is only one method that is available for automating the configuration and
management of systems, and the existence of this resource does not constitute an
endorsement of it.  Information on Puppet is available at www.puppetlabs.com.
Even if Puppet is not the management software used in your environment, these
files should demonstrate how to apply security-relevant settings from the
baseline.  These files should also demonstrate and reinforce the idea that
whenever many systems should be operating with similar settings, their
configuration and management should be automated by software designed for that
purpose.

Always test in a controlled lab environment before deploying any software on
production systems.

See the file INSTRUCTIONS for information on how to perform an installation of
Red Hat Enterprise Linux 5 and configure it to be compliant with the baseline.

## Acknowledgements
I consider myself (incredibly) fortunate to live in a time where information is so readily available. This project is an excellent example of such indirect collaboration at its best, through the many contributions of individuals much smarter than I, and whom I will probably never meet, I am able to "stand on the shoulders of giants", and work towards hopefully adding some value to the world.

With the above in mind, I would like to acknowledge the many individuals and projects that I've drawn upon while pursuing this endeavor:

### original codebase
* [USGCB RHEL 5 security configuration support modules](http://usgcb.nist.gov/usgcb/rhel_content.html)

### modules/ntp
* [puppetlabs/ntp](https://github.com/puppetlabs/puppetlabs-ntp)

### modules/puppet
* [fsalum/puppetmaster](https://github.com/fsalum/puppet-puppetmaster)

### skeleton
* [garenthr/puppet-module-skeleton](https://github.com/garethr/puppet-module-skeleton)
