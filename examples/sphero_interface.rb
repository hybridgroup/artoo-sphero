require 'artoo'

connection :sphero, :adaptor => :sphero, :port => '/dev/rfcomm0' #linux
device :sphero, :driver => :sphero

work do
  @rolling = false

  every(3.seconds) do
    puts "Rolling..."
    unless @rolling
      # TODO: `forward 90` should be equivilent
      interfaces(:rover).forward 90
      @rolling = true
    else
      # TODO: `backward 90` should be equivilent
      interfaces(:rover).backward 90
      @rolling = false
    end
  end
end
