require('./poker')
describe Poker do
  subject(:poker) { Poker.new }

  context 'when finder ' do
    it "" do
     expect { poker.finder("straight") }.to.contain("Iteration count")
    end
  end
end
