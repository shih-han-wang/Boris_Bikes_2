require_relative 'bike'

class DockingStation

  attr_reader :bike

  def release_bike
    fail 'No bike available' unless @bike
    Bike.new
  end

  def dock(bike)
    fail "Docking station is full" if @bike
    @bike = bike
  end

end
