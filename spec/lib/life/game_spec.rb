describe Life::Game do
  describe '#initialize' do
    subject { Life::Game.new(height: 10, width: 10) }
    it { expect(subject.height).to eq 10 }
    it { expect(subject.width).to eq 10 }
    it { expect(subject.cells.count).to eq 10 }
    it { expect(subject.cells.flatten.count).to eq 100 }
  end
end
