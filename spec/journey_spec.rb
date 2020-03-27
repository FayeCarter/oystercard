require 'journey'

describe Journey do

  let(:station) { double :station, zone: 1 }
  let(:exit_station) { double :station }

  it 'has an entry station' do
    journey = Journey.new
    journey.entry_station = station
    expect(journey.entry_station).to eq station
  end

  it 'has an exit station' do
    journey = Journey.new
    journey.exit_station = station
    expect(journey.exit_station).to eq station
  end

  it 'responds to the finish method' do
    expect(subject).to respond_to :finish
  end

  it '#finish completes the journey' do
    subject.finish(station)
    expect(subject).to be_complete
  end

  it 'responds to the fare method' do
    expect(subject).to respond_to :fare
  end

  it 'has a penalty fare by default' do
    expect(subject.fare).to eq Journey::PENALTY_FARE
  end

  it 'returns fare if journey complete' do
    subject.start(station)
    subject.finish(exit_station)
    expect(subject.fare).to eq Journey::MINIMUM_FARE
  end

  it 'responds to the compelete method' do
    expect(subject).to respond_to :complete?
  end

  it "knows if a journey is not complete" do
    expect(subject).not_to be_complete
  end

  it 'when journey is complete #complete' do
    subject.finish(station)
    expect(subject).to be_complete
  end

  it 'when journey is complete #complete' do
    subject.finish(station)
    expect(subject).to be_complete
  end

  it '#start exists on Journey class' do
    expect(subject).to respond_to(:start).with(1).argument
  end

  it '#start sets the entry station on the Journey class' do
    subject.start(station)
    expect(subject.entry_station).to eq(station)
  end
end
