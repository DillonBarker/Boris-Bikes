require 'vans.rb'
require 'docking_station.rb'
require 'bike.rb'
require 'garage.rb'

describe Garage do
  describe '#deliver_to_garage' do
    it 'takes broken bikes from van, stores them in garage to be fixed' do
      bike = Bike.new
      dock = DockingStation.new
      van = Vans.new
      garage = Garage.new
      bike.report_broken
      dock.dock(bike)
      van.load(dock.bikes)
      expect(garage.deliver_to_garage(van.broken_van_bikes)).to eq garage.bikes_to_be_fixed
    end
  end
  describe '#fix_bikes' do
    it 'takes broken bikes and fixes them' do
      bike = Bike.new
      dock = DockingStation.new
      van = Vans.new
      garage = Garage.new
      bike.report_broken
      20.times { dock.dock(bike) }
      van.load(dock.bikes)
      garage.deliver_to_garage(van.broken_van_bikes)
      expect(garage.fix_bikes(garage.bikes_to_be_fixed)).to eq garage.fixed_bikes
    end
  end
end
