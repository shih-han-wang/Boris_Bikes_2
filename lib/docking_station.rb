require_relative 'bike'

class DockingStation

  attr_reader :bike
  # def bike
  #   @bike
  # end
  attr_reader :collection
  attr_reader :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @collection = []
    @capacity = capacity
  end

  def release_bike
    fail 'No bike available' if empty?
    Bike.new
    @collection.pop
  end

  def dock(bike)
    fail "Docking station is full" if full?
    @collection << bike

  end

  private
  def full?
    @collection.count == @capacity
  end

  def empty?
    @collection.empty?
  end

end

# station = DockingStation.new
# p 19.times { station.dock Bike.new }
# p @collection
