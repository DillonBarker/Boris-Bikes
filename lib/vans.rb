class Vans
  attr_reader :capacity
  attr_reader :stored_bikes

DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @stored_bikes = []
  end

  def load(bike_array)
    bike_array.each do |bike|
      if bike.broken?
        @stored_bikes << bike
      else
        puts "bike was working so I didn't load it"
      end
    end
  end
end
