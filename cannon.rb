require 'bundler'
Bundler.require

usb = LIBUSB::Context.new

device = usb.devices(idVendor: 0x2123, idProduct: 0x1010).first

def send_command(device_handle, command)
  instructions = {
    bmRequestType: 0x21,
    bRequest: 0x09,
    wValue: 0,
    wIndex: 0,
    dataOut: [0x02, command, 0x00,0x00,0x00,0x00,0x00,0x00]
  }
  device_handle.control_transfer instructions
end

binding.pry

device.open_interface(0) do |handle|
  binding.pry
end
