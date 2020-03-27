require_relative 'journey.rb'

class Oystercard
  attr_reader :balance, :entry_station, :journeys
  CARD_LIMIT = 90
  MINIMUM_FUNDS = 1
  AMOUNT = 1

  def initialize(balance = 0)
    @balance = 0
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

    if @journey.entry_station != nil && @journey.exit_station == nil
      @journey.finish("didn't touch out")
      @journeys << @journey
      @journey = Journey.new
      @journey.entry_station = station
    else
      @journey = Journey.new
      @journey.entry_station = station
    end
  end

  def touch_out(station)
    deduct(AMOUNT)
    @journey.finish(station)
    @journeys << @journey
    @journey = nil
    station

  end

 private

  def deduct(amount)
    @balance -= amount
  end
end


