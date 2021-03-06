require 'vans.rb'
require 'docking_station.rb'
require 'bike.rb'
require 'garage.rb'

describe Vans do
  describe '#load' do
    it 'van loads broken bikes' do
      docking_station = DockingStation.new
      bike = Bike.new
      bike.report_broken
      10.times { docking_station.dock(bike) }
      bike2 = Bike.new
      10.times { docking_station.dock(bike) }
      van = Vans.new
      expect(van.load(docking_station.bikes)).to eq van.broken_van_bikes
    end
  end

  describe '#collect' do
    it 'collects fixed bikes from the garage' do
      bike = Bike.new
      dock = DockingStation.new
      van = Vans.new
      garage = Garage.new
      bike.report_broken
      20.times { dock.dock(bike) }
      van.load(dock.bikes)
      garage.deliver_to_garage(van.broken_van_bikes)
      garage.fix_bikes(garage.bikes_to_be_fixed)
      expect(van.collect(garage.fixed_bikes)).to eq van.fixed_van_bikes
    end
  end

end
