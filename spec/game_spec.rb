require 'game'

describe 'game start' do
  it 'generates the first round of players' do
    expect(game).to respond_to(generate_round_1).with(1).argument
  end

  it 'creates shuffled pairs for the first round' do
    game = Game.new(['David', 'David', 'David'])
    expect(game.round_1).to eq([['David', 'Bye'], ['David', 'David']])
  end
end
