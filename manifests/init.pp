# Class: usb_modeswitch
# =====================
#
# Simple module to configure usb_modeswitch
#
# Parameters
# ----------
#
# * `$target_vendor = '0x12d1'`
# "Specify modem vendor id"
# * `$target_product = '0x1f02'`
# "Specify modem product id"
#
# @example
#    class { 'usb_modeswitch':
#      target_vendor => '0x2f'
#      target_id => '0x12'
#    }
#
# Authors
# -------
#
# Petri Lammi <petri.lammi@tietoteema.fi>
#
# Copyright
# ---------
#
# Copyright 2016 Petri Lammi
#
class usb_modeswitch
(
  $target_vendor,
  $target_product
  
) inherits usb_modeswitch::params
{
  
  include ::stdlib

  $vendor_arr = split($target_vendor, 'x')
  $product_arr = split($target_product, 'x')

  $idvendor = $vendor_arr[1]
  $idproduct = $product_arr[1]

  validate_string($idvendor)
  validate_string($idproduct)
  validate_string($target_vendor)
  validate_string($target_product)

  include ::usb_modeswitch::install

  class { '::usb_modeswitch::config':
    target_vendor  => $target_vendor,
    target_product => $target_product,
    idvendor       => $idvendor,
    idproduct      => $idproduct,
  }
  
}
