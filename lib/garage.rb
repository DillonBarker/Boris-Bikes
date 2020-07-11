class Garage
  attr_reader :bikes_to_be_fixed, :capacity, :fixed_bikes

GARAGE_CAPACITY = 100

  def initialize(capacity = GARAGE_CAPACITY)
    @capacity = capacity
    @bikes_to_be_fixed = []
    @fixed_bikes = []
  end

  def deliver_to_garage(bike_array)
    bike_array.each do |bike|
        @bikes_to_be_fixed << bike
    end
  end

  def fix_bikes(bike_array)
    bike_array.each do |bike|
      bike.broken=(false)
      @fixed_bikes << bike
    end
  end






end
