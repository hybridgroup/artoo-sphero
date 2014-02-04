# Artoo Adaptor For Sphero

This repository contains the Artoo (http://artoo.io/) adaptor for the Sphero (http://gosphero.com) robot.

Artoo is a open source micro-framework for robotics using Ruby.

For more information abut Artoo, check out our repo at https://github.com/hybridgroup/artoo

[![Code Climate](https://codeclimate.com/github/hybridgroup/artoo-sphero.png)](https://codeclimate.com/github/hybridgroup/artoo-sphero) [![Build Status](https://travis-ci.org/hybridgroup/artoo-sphero.png?branch=master)](https://travis-ci.org/hybridgroup/artoo-sphero)

## Installing

```
gem install artoo-sphero
```

Afterwards you need to install `socat` - for this please run the following command (works on both OSX and Linux):

```
artoo install socat
```

## Using

```ruby
require 'artoo'

connection :sphero, :adaptor => :sphero, :port => '127.0.0.1:4567'
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

### OSX

The main steps are:
- Pair your computer and the Sphero
- Use a socket to serial connection to map a TCP socket to the local unix port
- Connect to the device via Artoo

First pair your computer and Sphero. You might be prompted for a passcode, but you do not need to enter it, sinec the Sphero does not check.

Once paired, use the `artoo connect scan` command to find out your connection info:

```
$ artoo connect scan
```

Now you are ready to connect to the Sphero using the socket, in this example port 4567:

```
artoo connect serial Sphero-WRW 4567
```

### Ubuntu

The main steps are:
- Pair your computer and the Sphero
- Map your device to a unix port
- Use a socket to serial connection to map a TCP socket to the local unix port
- Connect to the device via Artoo

First pair your computer and Sphero. You might be prompted for a passcode, but you do not need to enter it, sinec the Sphero does not check.

Once paired, use the `artoo connect scan` command to find out your connection info:

```
$ artoo connect scan
Scanning ...
  00:06:66:4A:14:99 Sphero-WRW
```

Next, you need to bind the Sphero to the system port. In the above example, /dev/Sphero-WRW. The easiest way to do this is to use the `artoo connect bind` command:

```
artoo connect bind 00:06:66:4A:14:99 Sphero-WRW
```

Now you are ready to connect to the Sphero using the socket, in this example port 4567:

```
artoo connect serial Sphero-WRW 4567
```

### Windows

We are currently working with the Celluloid team to add Windows support. Please check back soon!

## How To Calibrate Sphero

You might want to calibrate the orientation of the Sphero so that it is pointed 'forward'. There are 2 functions that have been added to the Sphero driver to help with this.

Call `start_calibration` to put the Sphero into 'calibration mode' by turning on the tail LED and turning off the auto-stablization. You can now manually turn the Sphero to so the tail LED is pointed to the rear of the direction in which you want the Sphero to go.

Call `finish_calibration` to turn off 'calibration mode' by turning off the tail LED and turning back on the auto-stablization. Whichever direction that the tail LED was pointed, is now the rear direction for the Sphero.
