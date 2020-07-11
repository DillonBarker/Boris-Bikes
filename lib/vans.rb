class Vans
  attr_reader :capacity, :broken_van_bikes, :fixed_van_bikes

VAN_CAPACITY = 20

  def initialize(capacity=VAN_CAPACITY)
    @capacity = capacity
    @broken_van_bikes = []
    @fixed_van_bikes = []
  end

  def load(bike_array)
    bike_array.each do |bike|
      if bike.broken?
        @broken_van_bikes << bike
      else
        puts "bike was working so I didn't load it"
      end
    end
  end

  def collect(bike_array)
     bike_array.each do |bike|
       @fixed_van_bikes << bike
     end
  end
end
