require File.expand_path(File.dirname(__FILE__) + "/../test_helper")
require 'artoo/interfaces/sphero'

describe Artoo::Interfaces::Sphero do
  before do
    @device = mock('device')
    @interface = Artoo::Interfaces::Sphero.new(:device => @device)
  end

  describe "Rover interface" do
    it 'Rover#forward' do
      @device.expects(:roll).with(0, 30)
      @interface.forward 30
    end

    it 'Rover#backward' do
      @device.expects(:roll).with(180, 30)
      @interface.backward 30
    end

    it 'Rover#right' do
      @device.expects(:roll).with(90, 30)
      @interface.right 30
    end

    it 'Rover#left' do
      @device.expects(:roll).with(270, 30)
      @interface.left 30
    end

    it 'Rover#turn_right'
    it 'Rover#turn_left'
    it 'Rover#stop' do
      @device.expects(:stop)
      @interface.stop
    end

  end
end
