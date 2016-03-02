#
# == Class: usb_modeswitch::config
#
class usb_modeswitch::config
(
  $target_vendor = $target_vendor,
  $target_product = $target_product,
  $idvendor = $idvendor,
  $idproduct = $idproduct,

) inherits usb_modeswitch::params {

  udev::rule { $::usb_modeswitch::params::udev_rules_file:
    ensure  => present,
    content => template("${module_name}/usb_modeswitch.rules.erb"),
    require => Package[ $::usb_modeswitch::params::packages ]
  }
  
}
