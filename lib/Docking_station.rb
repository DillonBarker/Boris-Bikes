require_relative 'bike'

class DockingStation
  attr_reader :bikes
  attr_reader :capacity

DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  def release_bike
    raise "There are no bikes" if empty?
    @bikes.pop
  end

  def dock(bike)
    raise "There are no spaces available" if full?
    @bikes << bike
  end

private
  def full?
    @bikes.count >= DEFAULT_CAPACITY
  end

  def empty?
    @bikes.count == 0
  end
end
