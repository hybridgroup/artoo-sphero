require File.expand_path(File.dirname(__FILE__) + "/../test_helper")
require 'artoo/drivers/sphero'

describe Artoo::Drivers::Sphero do
  before do
    @device = mock('device')
    @driver = Artoo::Drivers::Sphero.new(:parent => @device)
    @connection = mock('connection')
    @messages = Queue.new
    @messages << ::Sphero::Response::CollisionDetected.new("yo", "ho")
    @messages << ::Sphero::Response::CollisionDetected.new("yo", "ho")
    @messages << ::Sphero::Response::SensorData.new("yo", "ho")
    @messages << ::Sphero::Response::SensorData.new("lo", "no")
    @messages << ::Sphero::Response::SensorData.new("jo", "jo")
    @messages << ::Sphero::Response::PowerNotification.new("yo", "ho")
    @messages << ::Sphero::Response::PowerNotification.new("yo", "ho")
    @connection.stubs(:messages).returns(@messages)
    @device.stubs(:connection).returns(@connection)
  end

  it 'Sphero#handle_message_events' do
    @driver.stubs(:handle_collision_detected)
    @driver.stubs(:handle_power_notification)
    @driver.stubs(:handle_sensor_data)

    @messages.empty?.must_equal false
    @messages.size.must_equal 7

    @driver.handle_message_events
    
    @messages.empty?.must_equal true
    @messages.size.must_equal 0
  end

  describe 'color' do
    it 'Sphero#color(:red)' do
      r, g, b = @driver.color(:red)
      r.must_equal 255
      g.must_equal 0
      b.must_equal 0
    end

    it 'Sphero#color(:green)' do
      r, g, b = @driver.color(:green)
      r.must_equal 0
      g.must_equal 255
      b.must_equal 0
    end

    it 'Sphero#color(r, g, b)' do
      r, g, b = @driver.color(2, 4, 6)
      r.must_equal 2
      g.must_equal 4
      b.must_equal 6
    end
  end

  it 'should be able to start calibration process'
  it 'should be able to finish calibration process'
end
