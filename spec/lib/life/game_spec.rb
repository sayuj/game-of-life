describe Life::Game do
  subject { Life::Game.new(height: 10, width: 10) }

  describe '#initialize' do
    it { expect(subject.height).to eq 10 }
    it { expect(subject.width).to eq 10 }
    it { expect(subject.cells.count).to eq 10 }
    it { expect(subject.cells.flatten.count).to eq 100 }
  end

  describe '#neighbors' do
    it { expect(subject.neighbors(subject.cells[0][0]).count).to eq 3 }
    it { expect(subject.neighbors(subject.cells[0][1]).count).to eq 5 }
    it { expect(subject.neighbors(subject.cells[1][1]).count).to eq 8 }
    it { expect(subject.neighbors(subject.cells[9][1]).count).to eq 5 }
  end
end
