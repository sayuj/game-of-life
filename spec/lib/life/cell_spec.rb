describe Life::Cell do
  context 'initialize' do
    subject { Life::Cell.new(x: 0, y: 0, alive: true) }
    it { expect(subject.x).to eq 0 }
    it { expect(subject.y).to eq 0 }
    it { expect(subject.alive?).to eq true }
  end
end
