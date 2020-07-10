require 'Docking_station'

describe DockingStation do


  describe '#release_bike' do
    it 'Throws error when bike is released, and there are no bikes' do
      expect{subject.release_bike}.to raise_error("There are no bikes")
    end
    it 'cannot release a bike which is broken' do
      bike = Bike.new
      bike.report_broken
      subject.dock(bike)
      expect{subject.release_bike}.to raise_error("This bike is broken")
    end
  end

  describe '#dock' do
    it 'It fails to dock bike as maximum capacity has been reached' do
      DockingStation::DEFAULT_CAPACITY.times { subject.dock Bike.new }
      expect{subject.dock(Bike.new)}.to raise_error("There are no spaces available")
    end
  end

  describe '#initialize' do
    it 'Creates docking station with spaces other than 20' do
      docking_station = DockingStation.new(100)
      expect(docking_station.capacity).to eq 100
    end

    it 'Creates docking station with 20 spaces by default' do
      docking_station = DockingStation.new
      expect(docking_station.capacity).to eq DockingStation::DEFAULT_CAPACITY
    end
  end
end
