require 'journey'

describe Journey do

  let(:station) { double :station, zone: 1 }
  let(:exit_station) { double :station }

  it 'entry station can be set' do
    journey = Journey.new
    journey.entry_station = station
    expect(journey.entry_station).to eq station
  end

  it 'exit station can be set' do
    journey = Journey.new
    journey.exit_station = station
    expect(journey.exit_station).to eq station
  end

  describe '#start' do
    it 'exists on Journey class' do
      expect(subject).to respond_to(:start).with(1).argument
    end

    it 'sets the entry station on the Journey class' do
      subject.start(station)
      expect(subject.entry_station).to eq(station)
    end
  end

  describe '#finish' do
    it 'subject responds to the finish method' do
      expect(subject).to respond_to :finish
    end

    it 'sets the exit station on the Journey class' do
      subject.start(station)
      expect(subject.finish(station)).to eq(station)
    end
  end

  describe '#complete' do
    it 'subject responds to the compelete method' do
      expect(subject).to respond_to :complete?
    end

    it "is false by default" do
      expect(subject).not_to be_complete
    end

    it 'confirms a complete journey' do
      subject.start(station)
      subject.finish(station)
      expect(subject).to be_complete
    end
  end

  describe '#fare' do
    it 'subject responds to the fare method' do
      expect(subject).to respond_to :fare
    end

    it 'journey has penalty for an incomplete journey' do
      expect(subject.fare).to eq Journey::PENALTY_FARE
    end

    it 'returns minimum fare if the journey is complete' do
      subject.start(station)
      subject.finish(exit_station)
      expect(subject.fare).to eq Journey::MINIMUM_FARE
    end
  end
end
