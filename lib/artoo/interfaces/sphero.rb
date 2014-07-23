require 'artoo/interfaces/interface'

module Artoo
  module Interfaces
    # The Sphero Rover interface
    class Sphero < Rover
      def forward(speed)
        @device.roll 0, speed
      end

      def backward(speed)
        @device.roll 90, speed
      end

      def turn_left(degrees)
        # TODO: implement
      end

      def turn_right(degrees)
        # TODO: implement
      end

      def stop
        @device.stop
      end     
    end
  end
end