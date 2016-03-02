#
# == Class: usb_modeswitch::params
#
# Defines some variables based on the operating system
#
class usb_modeswitch::params {
  
  include ::os::params

  case $::osfamily {
    'RedHat': {
      
      case $::operatingsystemmajrelease {
        '7': {
          $packages = ['usb_modeswitch', 'usb_modeswitch-data']
          $udev_rules_file = '10-usb_modeswitch.rules'
        }
        
        default: {
          fail("Unsupported RedHat major release: ${::operatingsystemmajrelease}")
        }
      }
      
    }
    
    default: {
      fail("Unsupported operating system: ${::osfamily}/${::operatingsystem}")
    }
  }
  
}

  
