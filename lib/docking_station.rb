require_relative 'bike'

class DockingStation

  attr_reader :bike
  attr_reader :collection

  def initialize
    @collection = []
  end

  def release_bike
    fail 'No bike available' unless empty?
    Bike.new
    @collection.pop
  end

  def dock(bike)
    fail "Docking station is full" if full?
    @collection << bike

  end

  private
  def full?
    @collection.count == 3
  end

  def empty?
    @collection.empty?
  end

end

# station = DockingStation.new
# p 19.times { station.dock Bike.new }
# p @collection
