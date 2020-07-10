class Bike

attr_reader :broken

  def intialize
    @broken = false
  end

  def broken?
    @broken
  end

  def report_broken
    @broken = true
  end
end
