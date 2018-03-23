require_relative 'bike'

class DockingStation

  # attr_reader :bike
  # # def bike
  # #   @bike
  # # end
  # attr_reader :collection
  attr_reader :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @collection = []
    @capacity = capacity
  end

  def release_bike
    raise 'No bike available' if empty? || !@collection.any? {|bike| bike.working}
    @collection.delete_at(@collection.index{|bike| bike.working})
  end

  def dock(bike, broken = false)
    raise "Docking station is full" if full?
    bike.working = false if broken
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
