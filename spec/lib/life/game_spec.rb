describe Life::Game do
  subject { Life::Game.new(height: 10, width: 10) }

  describe '#initialize' do
    it { expect(subject.height).to eq 10 }
    it { expect(subject.width).to eq 10 }
    it { expect(subject.cells.count).to eq 10 }
    it { expect(subject.cells.flatten.count).to eq 100 }

    context 'with initial state' do
      subject { Life::Game.new(height: 10, width: 10, live_cells: [[1, 1], [1, 2], [1, 3]]) }
      it { expect(subject.cells[0][0].alive?).to eq false }
      it { expect(subject.cells[1][1].alive?).to eq true }
      it { expect(subject.cells[1][2].alive?).to eq true }
      it { expect(subject.cells[2][2].alive?).to eq false }
    end
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

  describe '#evolve' do
    before do
      subject.cells[0][0].alive!
      subject.cells[0][2].alive!
      subject.cells[1][0].alive!
    end

    it 'evolves the game to next generation' do
      subject.evolve!
      expect(subject.cells[0][0].alive?).to eq false
      expect(subject.cells[0][1].alive?).to eq true
      expect(subject.cells[1][0].alive?).to eq false
      expect(subject.cells[1][1].alive?).to eq true
    end
  end

  describe '#display' do
    subject { Life::Game.new(height: 5, width: 5) }

    before do
      subject.cells[0][0].alive!
      subject.cells[0][2].alive!
      subject.cells[1][0].alive!
    end

    it 'displays with * for live cell and - for dead cell' do
      expect(subject).to receive(:puts).with("*\t-\t*\t-\t-\n\n"\
                                    "*\t-\t-\t-\t-\n\n"\
                                    "-\t-\t-\t-\t-\n\n"\
                                    "-\t-\t-\t-\t-\n\n"\
                                    "-\t-\t-\t-\t-")
      subject.display
    end
  end

  describe '#play' do
    it 'evolves to next generation and displays the cells every seconds' do
      expect(subject).to receive(:loop).and_yield
      expect(subject).to receive(:system).with('clear')
      expect(subject).to receive(:display)
      expect(subject).to receive(:evolve!)
      expect(subject).to receive(:sleep).with(1)
      subject.play
    end
  end
end
