class Journey

  attr_accessor :entry_station, :exit_station

  PENALTY_FARE = 6

  def initialize
    @entry_station
    @exit_station
  end

  def start(station)
    @entry_station = station
  end

  def finish(station)
    @exit_station = station
    self
  end

  def fare
    PENALTY_FARE
  end

  def complete?
    @exit_station != nil ? true : false
  end

end
