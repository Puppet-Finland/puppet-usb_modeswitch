#
# == Class: openstack::usb_modeswitch::install
#
class usb_modeswitch::install inherits usb_modeswitch::params

{
  
  package { $::usb_modeswitch::params::packages:
    ensure => installed,
  }
  
}
