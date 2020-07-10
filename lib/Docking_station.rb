require_relative 'bike'

class DockingStation
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def release_bike
    raise "There are no bikes" if @bikes.count == 0
    @bikes.pop
  end

  def dock(bike)
    raise "There are no spaces available" if @bikes.count == 20
    @bikes << bike
  end
end
