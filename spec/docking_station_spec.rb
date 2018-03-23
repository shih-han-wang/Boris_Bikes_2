require 'docking_station'

describe DockingStation do
  it { is_expected.to respond_to(:dock).with(1).argument }

  it { is_expected.to respond_to :release_bike }

  it 'default capacity is 20 when no argument given' do
    expect(subject.capacity).to be 20
  end

  it 'releases working bikes' do
    subject.dock Bike.new
    bike = subject.release_bike
    expect(bike).to be_working
  end

  # it 'docks something' do
  #   bike = Bike.new
  #   expect(subject.dock(bike)).to eq bike
  # end

  it 'return docked bikes' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bike).to eq @bike
  end

  describe '#release_bike' do
    it 'raises an error' do
      # 20.times { subject.dock Bike.new }
      expect { subject.release_bike }.to raise_error ("No bike available")
    end
  end

  describe '#dock' do
    it ' raises an error when full' do
      DockingStation::DEFAULT_CAPACITY.times do
        subject.dock Bike.new
      end
      expect { subject.dock("bike") }.to raise_error ("Docking station is full")
    end
  end


end
