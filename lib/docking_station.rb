#require_relative 'bike.rb'

class DockingStation
  attr_reader :bikes, :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    raise 'No bikes available' if empty? || all_broken?
    @bikes.pop
  end

  def dock(bike)
    raise 'This docking station is full' if full?
    @bikes << bike
  end

  private

  def full?
    bikes.length >= DEFAULT_CAPACITY
  end

  def empty?
    bikes == []
  end

  def all_broken?
    bikes.all? {|bike| bike.broken? }
  end
end
