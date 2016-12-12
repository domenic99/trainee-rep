require('./poker')
describe Poker do
  subject(:poker) { Poker.new }

  context 'variables before/after satrt' do
    it 'if before should be nil' do
      expect(poker.your_cards).to eq(nil)
      expect(poker.flop_cards).to eq(nil)
      expect(poker.all_cards).to eq(nil)
      expect(poker.result).to eq(nil)
      expect(poker.position).to eq(nil)
    end

    it 'if after shouldn\'t be nil' do
      poker.start_game
      expect(poker.your_cards).not_to eq(nil)
      expect(poker.flop_cards).not_to eq(nil)
      expect(poker.all_cards).not_to eq(nil)
      expect(poker.result).not_to eq(nil)
      expect(poker.position).not_to eq(nil)
    end
  end

  context 'finder method' do
    it 'when right parametr' do
      expect { poker.finder('straight flush') }
        .to_not raise_error('Wrong combination')
    end

    it 'when wrong parametr' do
      expect { poker.finder('blabla') }.to raise_error('Wrong combination')
    end
  end

  context 'play method' do
    it 'shouldn\'t raise error' do
      expect { poker.play }.to_not raise_error
    end

    it 'should return winning combination' do
      expect { poker.play }.to output(/Your winning combination/).to_stdout
    end
  end

  context 'start_game method' do
    it 'shouldn\'t raise error' do
      expect { poker.start_game }.to_not raise_error
    end

    it 'should return winning combination' do
      inst = poker.start_game
      expect inst .should start_with('Your winning combination')
    end
  end

  # context 'check_for_combination method' do
  #  it 'shouldn\'t raise error' do
  #    expect { poker.check_for_combination }.to_not raise_error
  # end
  #
  #  it 'should return winning combination' do
  #    inst = poker.check_for_combination
  #    expect (inst).should start_with("Your winning combination")
  # end
  # end
end
