require 'docking_station'

describe DockingStation do
  # it { is_expected.to respond_to(:dock).with(1).argument }
  #
  # it { is_expected.to respond_to :release_bike }

  it 'default capacity is 20 when no argument given' do
    expect(subject.capacity).to be 20
  end

  describe '#release_bike' do
    it "releases bike if there is a bike" do
      station = DockingStation.new
      station.dock double(:bike)
      expect(station.release_bike).to be_an_instance_of(Bike)
    end
    it 'raises an error when no bike available' do
      expect { subject.release_bike }.to raise_error ("No bike available")
    end
    it 'raises an error when all bikes are broken' do
      station = DockingStation.new
      10.times{ station.dock(double(:bike), true) }
      expect { station.release_bike }.to raise_error ("No bike available")
    end
    it 'releases working bikes' do
      station = DockingStation.new
      station.dock(double(:bike), true)
      station.dock(double(:bike))
      station.dock(double(:bike), true)
      expect(station.release_bike.working).to eq true
    end
  end

  # it 'docks something' do
  #   bike = Bike.new
  #   expect(subject.dock(bike)).to eq bike
  # end

  # it 'return docked bikes' do
  #   bike = Bike.new
  #   subject.dock(bike)
  #   expect(subject.bike).to eq @bike
  # end


  describe '#dock' do
    it ' raises an error when full' do
      station = DockingStation.new(40)
      40.times {station.dock double(:bike)}
      expect { station.dock("bike") }.to raise_error ("Docking station is full")
    end

    it 'docks bike if station not full' do
      station = DockingStation.new
      bike = double(:bike)
      expect(station.dock(bike)).to include(bike)
    end

    it 'allowed to report the bike is broken' do
      station = DockingStation.new
      bike = double(:bike)
      station.dock(bike, true)
      expect(bike.working).to eq false
    end
  end
end
