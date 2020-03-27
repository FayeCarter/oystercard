require 'journey'

describe Journey do

  let(:station) { double :station, zone: 1}

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
    expect(subject.finish(station)).to eq subject
  end

  it 'responds to the fare method' do
    expect(subject).to respond_to :fare
  end

  it 'has a penalty fare by default' do
    expect(subject.fare).to eq Journey::PENALTY_FARE
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
  # when entry station  
    subject.finish(station)
    expect(subject).to be_complete
  end

  it '#start exists on Journey class' do
    expect(subject).to respond_to(:start).with(1).argument
  end

end