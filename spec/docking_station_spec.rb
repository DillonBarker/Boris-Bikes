require 'Docking_station'

describe DockingStation do


  describe '#release_bike' do
    it 'Throws error when bike is released, and there are no bikes' do
      expect{subject.release_bike}.to raise_error("There are no bikes")
    end

    it 'Released bike is working' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to be_working
    end
  end

  describe '#dock' do
    it 'It fails to dock bike as maximum capacity has been reached' do
      20.times { subject.dock Bike.new }
      expect{subject.dock(Bike.new)}.to raise_error("There are no spaces available")
    end
  end
end
