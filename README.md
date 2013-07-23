# Artoo Adaptor For Sphero

This repository contains the Artoo (http://artoo.io/) adaptor for the Sphero (http://gosphero.com) robot.

Artoo is a open source micro-framework for robotics using Ruby.

For more information abut Artoo, check out our repo at https://github.com/hybridgroup/artoo

[![Code Climate](https://codeclimate.com/github/hybridgroup/artoo-sphero.png)](https://codeclimate.com/github/hybridgroup/artoo-sphero) [![Build Status](https://travis-ci.org/hybridgroup/artoo-sphero.png?branch=master)](https://travis-ci.org/hybridgroup/artoo-sphero)

## Installing

```
gem install artoo-sphero
```

## Connecting to Sphero

### OSX

Someone please fill in the blanks here...

### Ubuntu

The main steps are:
- Pair your computer and the Sphero
- Map your device to a unix port
- Use a socket to serial connection to map a TCP socket to the local unix port
- Connect to the device via Artoo

First pair your computer and Sphero.

Once paired, use the hcitool program's 'scan' feature to find out your connection info:

```
$ hcitool scan
Scanning ...
  00:06:66:4A:14:99 Sphero-WRW
```

Next, you need to bind the Sphero to the system port. In the above example, /dev/Sphero-WRW. The easiest way to do this is to use the included "sphero_linux_bind.sh" script:

```
sudo ./bin/sphero_linux_bind.sh 1 00:06:66:4A:14:99 WRW
```

Now you are finally ready to connect to the Sphero using the socket, in this example port 4567:

```
sudo chmod 666 /dev/Sphero-WRW
./bin/sphero_linux_socat.sh 4567 Sphero-WRW
```

### Windows

Someone please fill in the blanks here...
