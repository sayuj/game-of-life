describe Life::Cell do
  describe '#initialize' do
    subject { Life::Cell.new(x: 0, y: 0, alive: true) }
    it { expect(subject.x).to eq 0 }
    it { expect(subject.y).to eq 0 }
    it { expect(subject.alive?).to eq true }
  end

  describe '#alive!' do
    subject { Life::Cell.new(x: 0, y: 0, alive: false) }
    it 'makes a cell alive' do
      subject.alive!
      expect(subject.alive?).to eq true
    end
  end

  describe '#dead!' do
    subject { Life::Cell.new(x: 0, y: 0, alive: true) }
    it 'makes a cell dead' do
      subject.dead!
      expect(subject.alive?).to eq false
    end
  end
end
