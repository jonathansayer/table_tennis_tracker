require 'game'

describe Game do

  it "responds to generate round 1" do
    game = Game.new([1])
    expect(game).to respond_to(:generate_round_1).with(1).argument
  end

  it 'creates shuffled pairs for the first round' do
    game = Game.new(['David', 'David', 'David'])
    expect(game.round_1).to eq([['David', 'Bye'], ['David', 'David']])
  end
end