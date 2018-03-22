require './lib/docking_station'

station = DockingStation.new
# puts station.full?
station.dock Bike.new
# puts station.full?
station.dock Bike.new
station.dock Bike.new
# puts station.full?

station.dock Bike.new
