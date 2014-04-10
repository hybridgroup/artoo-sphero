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

      COMMANDS = [:ping, :version, :bluetooth_info, :auto_reconnect,
                  :disable_auto_reconnect, :power_state, :sphero_sleep, :roll,
                  :stop, :heading, :stabilization, :color, :rgb, :set_color,
                  :back_led_output, :rotation_rate, :set_power_notification,
                  :set_data_streaming, :detect_collisions,
                  :handle_message_events, :get_rgb].freeze

      # Starts drives and required connections

      # Public: Starts the driver.
      #
      # Returns null.
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

      # Public: Handles different message events.
      #
      # Returns sphero_event.
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

      # Public: Sets the sphero to detect collisions and report them.
      #
      # Returns true | nil.
      def detect_collisions(params={})
        connection.configure_collision_detection 0x01, 0x20, 0x20, 0x20, 0x20, 0x50
      end

      # Set color
      # @param [Collection] colors

      # Public: You can either use it in tandem with color to set the color of the 
      # sphero or just pass an array containing RGB colors on the range 0 to 255 
      # ([255, 0, 0] == red).
      #
      # red - params
      # green - params
      # blue -params
      #
      # Returns true | nil.
      def set_color(*colors)
        connection.rgb(*color(*colors), true)
      end

      # Retrieves color
      # @param [Collection] colors

      # Public: You can pass a color as a symbol or an array containing RGB colors from 0 to 255 
      # ([255, 0, 0] == red), if passed a symbol returns the array of RGB corresponding to the 
      # color, if passed an array of colors it returns the same array (used when setting colors to the sphero).
      #
      # :color_symbol - color
      # red - params
      # green - params
      # blue -params
      #
      # Returns true | nil.
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

      # Get the sphero color

      # Public: You can retrieve current sphero color
      #
      # Returns array of rgb values
      def get_rgb
        rgb = connection.user_led

        [rgb.r, rgb.g, rgb.b] if rgb
      end

      private

      # Publish collision events

      # Handles collision message events.
      #
      # data - params
      #
      # Returns nil.
      def handle_collision_detected(data)
        publish(event_topic_name("collision"), data)
      end

      # Publish collision events

      # Public: Handles power message events.
      #
      # data - params
      #
      # Returns nil.
      def handle_power_notification(data)
        publish(event_topic_name("power"), data)
      end

      # Publish collision events

      # Handles sensor message events.
      #
      # data - params
      #
      # Returns nil.
      def handle_sensor_data(data)
        publish(event_topic_name("sensor"), data)
      end
    end
  end
end
