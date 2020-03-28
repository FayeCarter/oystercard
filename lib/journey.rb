class Journey
  attr_accessor :entry_station, :exit_station

  PENALTY_FARE = 6
  MINIMUM_FARE = 1

  def initialize
    @entry_station
    @exit_station
  end

  def start(station)
    @entry_station = station
  end

  def finish(station)
    @exit_station = station
  end

  def fare
    complete? ? MINIMUM_FARE : PENALTY_FARE
  end

  def complete?
    p @entry_station
    p @exit_station
    @exit_station != nil && @entry_station != nil ? true : false
  end
end
