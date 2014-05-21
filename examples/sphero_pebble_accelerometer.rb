require 'artoo'

connection :sphero, :adaptor => :sphero, :port => '/dev/rfcomm0' #linux
#connection :sphero, :adaptor => :sphero, :port => '127.0.0.1:4567'
device     :sphero, :driver  => :sphero

connection :pebble, :adaptor => :pebble
device     :watch,  :driver  => :pebble, :name => 'pebble'

api :host => '0.0.0.0', :port => '8080'

name 'pebble'

work do
  on pebble, :accel => :set_direction

  every(1.seconds) do
    sphero.roll 100, heading
  end
end

def set_direction(*data)
  x, y = data[1].split(",")

  @heading = direction(x.to_i, y.to_i)
end

def direction(x, y)
  (180.0 - (Math.atan2(y,x) * (180.0 / Math::PI)))
end

def heading
  @heading || 0
end
