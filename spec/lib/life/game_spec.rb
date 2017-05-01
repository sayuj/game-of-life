describe Life::Game do
  subject { Life::Game.new(height: 10, width: 10) }

  describe '#initialize' do
    it { expect(subject.height).to eq 10 }
    it { expect(subject.width).to eq 10 }
    it { expect(subject.cells.count).to eq 10 }
    it { expect(subject.cells.flatten.count).to eq 100 }
  end

  describe '#neighbours' do
    it { expect(subject.neighbours(subject.cells[0][0]).count).to eq 3 }
    it { expect(subject.neighbours(subject.cells[0][1]).count).to eq 5 }
    it { expect(subject.neighbours(subject.cells[1][1]).count).to eq 8 }
    it { expect(subject.neighbours(subject.cells[9][1]).count).to eq 5 }
  end

  describe '#next_generation' do
    before do
      subject.cells[0][0].alive!
      subject.cells[1][1].alive!
      subject.cells[1][2].alive!
      subject.cells[2][2].alive!
      subject.cells[2][3].alive!
      subject.cells[3][3].alive!
    end

    context 'Rule 1: live cell with fewer than two live neighbourss dies' do
      it { expect(subject.cells[0][0].alive?).to eq true }
      it { expect(subject.next_generation(subject.cells[0][0]).alive?).to eq false }
    end

    context 'Rule 2: live cell with two or three live neighbourss lives on to the next generation' do
      it { expect(subject.cells[1][1].alive?).to eq true }
      it { expect(subject.next_generation(subject.cells[1][1]).alive?).to eq true }
    end

    context 'Rule 3: live cell with more than three live neighbourss dies' do
      it { expect(subject.cells[2][2].alive?).to eq true }
      it { expect(subject.next_generation(subject.cells[2][2]).alive?).to eq false }
    end

    context 'Rule 4: dead cell with exactly three live neighbourss becomes a live cell' do
      it { expect(subject.cells[2][1].alive?).to eq false }
      it { expect(subject.next_generation(subject.cells[2][1]).alive?).to eq true }
    end
  end
end
