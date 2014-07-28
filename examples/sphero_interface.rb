require 'artoo'

connection :sphero, :adaptor => :sphero, :port => '/dev/rfcomm0' #linux
device :sphero, :driver => :sphero

work do
  @rolling = false

  every(3.seconds) do
    puts "Rolling..." 
    unless @rolling
      # same as interfaces[:rover].forward(90)
      forward(90)
      @rolling = true
    else
      #  same as interfaces[:rover].backward(90)
      backward(90)
      @rolling = false
    end
  end
end
