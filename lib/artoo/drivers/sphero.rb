require 'artoo/drivers/driver'

module Artoo
  module Drivers
    # The Sphero driver behaviors
    class Sphero < Driver

      RED     = [255, 0,   0]
      GREEN   = [0,   255, 0]
      YELLOW  = [255, 255, 0]
      BLUE    = [0,   0,   255]
      WHITE   = [255, 255, 255]

      COMMANDS = [:roll, :stop, :detect_collisions, :messages, :set_color, :color].freeze

      # Starts drives and required connections
      def start_driver
        begin
          detect_collisions

          every(interval) do
            handle_message_events
          end

          super
        rescue Exception => e
          Logger.error "Error starting Sphero driver!"
          Logger.error e.message
          Logger.error e.backtrace.inspect
        end
      end

      def handle_message_events         
        while not connection.messages.empty? do        
          evt = connection.messages.pop
          case 
          when evt.is_a?(::Sphero::Response::CollisionDetected)
            handle_collision_detected(evt)
          when evt.is_a?(::Sphero::Response::PowerNotification)
            handle_power_notification(evt)
          when evt.is_a?(::Sphero::Response::SensorData)
            handle_sensor_data(evt)
          end
        end
      end

      # Detects collisions
      # @param [Hash] params
      def detect_collisions(params={})
        connection.configure_collision_detection 0x01, 0x20, 0x20, 0x20, 0x20, 0x50
      end

      # Set color
      # @param [Collection] colors
      def set_color(*colors)
        connection.rgb(*color(*colors))
      end

      # Retrieves color
      # @param [Collection] colors
      def color(*colors)
        case colors.first
        when :red    then RED
        when :green  then GREEN
        when :yellow then YELLOW
        when :blue   then BLUE
        when :white  then WHITE
        else colors
        end
      end

      private

      # Publish collision events
      def handle_collision_detected(data)
        publish(event_topic_name("collision"), data)
      end

      # Publish collision events
      def handle_power_notification(data)
        publish(event_topic_name("power"), data)
      end

      # Publish collision events
      def handle_sensor_data(data)
        publish(event_topic_name("sensor"), data)
      end
    end
  end
end
