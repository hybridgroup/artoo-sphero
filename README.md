# Artoo Adaptor For Sphero

This repository contains the Artoo (http://artoo.io/) adaptor for the Sphero (http://gosphero.com) robot.

Artoo is a open source micro-framework for robotics using Ruby.

For more information abut Artoo, check out our repo at https://github.com/hybridgroup/artoo

[![Code Climate](https://codeclimate.com/github/hybridgroup/artoo-sphero.png)](https://codeclimate.com/github/hybridgroup/artoo-sphero) [![Build Status](https://travis-ci.org/hybridgroup/artoo-sphero.png?branch=master)](https://travis-ci.org/hybridgroup/artoo-sphero)

## Installing

```
gem install artoo-sphero
```

Afterwards you need to install `hybridgroup-serialport`

```
gem install hybridgroup-serialport
```

## Using

```ruby
require 'artoo'

connection :sphero, :adaptor => :sphero, :port => '/dev/rfcomm0' #linux
device :sphero, :driver => :sphero
  
work do
  @rolling = false

  every(3.seconds) do
    puts "Rolling..."
    sphero.roll 90, rand(360)
  end
end
```
## Connecting to Sphero

### OSX / Linux

The main steps are:
- Pair your computer and the Sphero
- Map your device to a unix port
- Connect to the device via Artoo

First pair your computer and Sphero. You might be prompted for a passcode, but you do not need to enter it, sinec the Sphero does not check.

Once paired, use the `artoo connect scan` command to find out your connection info:

```
$ artoo connect scan
```

Now you are ready to connect to the Sphero, update the code to use correct serial port:

```
connection :sphero, :adaptor => :sphero, :port => '/dev/rfcomm0' #linux
```

### Windows

We are currently working with the Celluloid team to add Windows support. Please check back soon!

## How To Calibrate Sphero

You might want to calibrate the orientation of the Sphero so that it is pointed 'forward'. There are 2 functions that have been added to the Sphero driver to help with this.

Call `start_calibration` to put the Sphero into 'calibration mode' by turning on the tail LED and turning off the auto-stablization. You can now manually turn the Sphero to so the tail LED is pointed to the rear of the direction in which you want the Sphero to go.

Call `finish_calibration` to turn off 'calibration mode' by turning off the tail LED and turning back on the auto-stablization. Whichever direction that the tail LED was pointed, is now the rear direction for the Sphero.
