# Artoo Adaptor For Sphero

This repository contains the Artoo (http://artoo.io/) adaptor for the Sphero (http://gosphero.com) robot.

Artoo is a open source micro-framework for robotics using Ruby.

For more information abut Artoo, check out our repo at https://github.com/hybridgroup/artoo

[![Code Climate](https://codeclimate.com/github/hybridgroup/artoo-sphero.png)](https://codeclimate.com/github/hybridgroup/artoo-sphero) [![Build Status](https://travis-ci.org/hybridgroup/artoo-sphero.png?branch=master)](https://travis-ci.org/hybridgroup/artoo-sphero)

## Installing

```
gem install artoo-sphero
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

Once paired, use the `artoo scan serial` command to find out your connection info:

```
$ artoo scan serial
```

Now you are ready to connect to the Sphero, update the code to use correct serial port:

```
connection :sphero, :adaptor => :sphero, :port => '/dev/rfcomm0' #linux
```

### Windows

We are currently working with the Celluloid team to add Windows support. Please check back soon!

## Documentation

Check out our [documentation](http://artoo.io/documentation/) for lots of information about how to use Artoo.

If you want to help us with some documentation on the site, you can go to [artoo.io branch](https://github.com/hybridgroup/artoo/tree/artoo.io) and then, follow the instructions.

## IRC

Need more help? Just want to say "Hello"? Come visit us on IRC freenode #artoo

## Contributing
* All active development is in the dev branch. New or updated features must be added to the dev branch. Hotfixes will be considered on the master branch in situations where it does not alter behaviour or features, only fixes a bug.
* All patches must be provided under the Apache 2.0 License
* Please use the -s option in git to "sign off" that the commit is your work and you are providing it under the Apache 2.0 License
* Submit a Github Pull Request to the appropriate branch and ideally discuss the changes with us in IRC.
* We will look at the patch, test it out, and give you feedback.
* Avoid doing minor whitespace changes, renamings, etc. along with merged content. These will be done by the maintainers from time to time but they can complicate merges and should be done seperately.
* Take care to maintain the existing coding style.
* Add unit tests for any new or changed functionality.
* All pull requests should be "fast forward"
  * If there are commits after yours use “git rebase -i <new_head_branch>”
  * If you have local changes you may need to use “git stash”
  * For git help see [progit](http://git-scm.com/book) which is an awesome (and free) book on git


(c) 2012-2014 The Hybrid Group
