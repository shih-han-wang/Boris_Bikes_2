require_relative 'bike'

class DockingStation

  attr_reader :bike
  attr_reader :collection

  def initialize
    @collection = []
  end

  def release_bike
    fail 'No bike available' unless @collection.count > 0
    Bike.new
    @collection.pop
  end

  def dock(bike)
    fail "Docking station is full" if @collection.count == 20
    @bike = bike
    @collection.push(@bike)
  end

end

# station = DockingStation.new
# p 19.times { station.dock Bike.new }
# p @collection
