require_relative 'journey.rb'

class Oystercard
  
  attr_reader :balance, :entry_station, :journeys

  CARD_LIMIT = 90
  MINIMUM_FUNDS = 1

  def initialize(balance = 0)
    @balance = balance
    @entry_station
    @journeys = []
    @journey = Journey.new
  end

  def top_up(amount)
    raise 'Over limit' if @balance + amount > CARD_LIMIT
    @balance = amount
  end

  def touch_in(station)
    raise "insufficient balance" if @balance < MINIMUM_FUNDS

    end_journey(nil) if @journey.entry_station != nil
    start_journey(station)
  end

  def touch_out(station)
    @journey.entry_station = nil if @journey.exit_station != nil
    end_journey(station)
    start_journey(nil)
  end

  def start_journey(station)
    @journey = Journey.new
    @journey.start(station)
  end

  def end_journey(station)
    @journey.finish(station)
    deduct
    @journeys << @journey
  end

 private

  def deduct
      @balance -= @journey.fare
  end
end
