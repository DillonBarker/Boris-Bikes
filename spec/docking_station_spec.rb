require 'Docking_station'
require 'bike'
require 'garage'
require 'vans'

describe DockingStation do

  describe '#release_bike' do
    it 'Throws error when bike is released, and there are no bikes' do
      expect{subject.release_bike}.to raise_error("There are no bikes")
    end

    it 'cannot release a bike which is broken' do
      bike = double("bike", :broken? => true)
      subject.dock(bike)
      expect{subject.release_bike}.to raise_error("This bike is broken")
    end

    it 'Releases a bike that isnt broken' do
      bike = double("bike", :broken? => false)
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end
  end

  describe '#dock' do
    it 'It fails to dock bike as maximum capacity has been reached' do
      DockingStation::DEFAULT_CAPACITY.times { subject.dock double(:bike) }
      expect{subject.dock double(:bike)}.to raise_error("There are no spaces available")
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

  describe '#distribute' do
    it 'puts fixed bikes back into docking stations' do
      bike = Bike.new
      docking_station = DockingStation.new
      docking_station2 = DockingStation.new
      van = Vans.new
      garage = Garage.new
      bike.report_broken
      docking_station.dock(bike)
      van.load(docking_station.bikes)
      garage.deliver_to_garage(van.broken_van_bikes)
      garage.fix_bikes(garage.bikes_to_be_fixed)
      van.collect(garage.fixed_bikes)
      expect(docking_station2.distribute(van.fixed_van_bikes)).to eq docking_station2.bikes
    end
  end
end
