require_relative '../lib/docking_station.rb'
require_relative '../lib/bike.rb'
require_relative '../lib/van.rb'

def variable_capacity
  capacity = 30
  station = DockingStation.new(capacity)
  station.capacity == capacity
end

def default_capacity
  station = DockingStation.new
  station.capacity == DockingStation::DEFAULT_CAPACITY
end

def report_broken
  bike = Bike.new
  bike.report_broken
  bike.broken? == true
end

def release_broken_bike
  bike = Bike.new
  bike.report_broken
  station = DockingStation.new
  station.dock(bike)
  station.release_bike
end

def accept_broken_bike
  bike = Bike.new
  bike.report_broken
  station = DockingStation.new
  station.dock(bike)
  station.bikes.first.broken?
end

def collect_broken_bikes
  station = DockingStation.new
  bike = Bike.new
  van = Van.new
  bike.report_broken
  station.dock(bike)
  van.collect_broken_bikes(station)
end
