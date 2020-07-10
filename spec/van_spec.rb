require 'vans.rb'
require 'docking_station.rb'
require 'bike.rb'

describe Vans do
  it 'van loads broken bikes' do
    docking_station = DockingStation.new
    bike = Bike.new
    bike.report_broken
    10.times { docking_station.dock(bike) }
    van = Vans.new
    expect(van.load(docking_station.bikes)).to eq van.stored_bikes
  end
end
