require 'game'

describe Game do

  it "responds to generate round 1" do
    game = Game.new([1])
    expect(game).to respond_to(:generate_round_1).with(1).argument
  end

  it 'creates shuffled pairs for the first round' do
    game = Game.new(['David', 'David', 'David'])
    expect(game.current_round).to eq([['David', 'Bye'], ['David', 'David']])
  end

  it 'generates the second round of players' do
    Game.any_instance.stub(generate_round_1: [['David', 'x'], ['Faisal', 'x'], ['Jonathan', 'x'], ['Kirsten', 'x']])
    game = Game.new([])
    game.winner('David')
    game.winner('Faisal')
    game.winner('Jonathan')
    game.winner('Kirsten')
    expect(game.next_round).to eq([['David', 'Faisal'], ['Jonathan', 'Kirsten']])
  end

  it 'generates the third round of players' do
    Game.any_instance.stub(generate_round_1: [['David', 'x'], ['Faisal', 'x'], ['Jonathan', 'x'], ['Kirsten', 'x']])
    game = Game.new([])
    game.winner('David')
    game.winner('Faisal')
    game.winner('Jonathan')
    game.winner('Kirsten')
    game.update_rounds
    game.winner('David')
    game.winner('Kirsten')
    expect(game.next_round).to eq([['David', 'Kirsten']])
  end

  it 'generates the third round of players' do
    Game.any_instance.stub(generate_round_1: [['David', 'x'], ['Faisal', 'x'], ['Jonathan', 'x'], ['Kirsten', 'x']])
    game = Game.new([])
    game.winner('David')
    game.winner('Faisal')
    game.winner('Jonathan')
    game.winner('Kirsten')
    game.update_rounds
    game.winner('David')
    game.winner('Kirsten')
    game.update_rounds
    expect(game.update_tournament_table).to eq(
    [
      [['David', 'x'], ['Faisal', 'x'], ['Jonathan', 'x'], ['Kirsten', 'x']],
      [['David', 'Faisal'], ['Jonathan', 'Kirsten']],
      [['David', 'Kirsten']],
      []])
  end



end
