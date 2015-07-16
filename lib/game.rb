class Game

attr_reader :current_round
attr_reader :players
attr_accessor :next_round
attr_reader :all_rounds

  def initialize(ids)
    @players = ids
    @current_round = generate_round_1(ids)
    @next_round = Array.new(current_round.length/2){ Array.new(0) }
    @all_rounds = tournament_table
  end

  def tournament_table
    table = [current_round]
    until table[-1].length == 1 do
      table << Array.new(table[-1].length/2){ Array.new(0) }
    end
    table
  end

  def generate_round_1 ids
    first_round_players = ids.shuffle
    n = 1
    byes.times {
      first_round_players.insert(n, "Bye")
      n += 2
    }
    first_round_pairs = first_round_players.each_slice(2).to_a
  end

  def gamesize
    2**((Math.log(players.length, 2)).ceil)
  end

  def byes
    gamesize - players.length
  end

  def winner(id)
    flat_current_players = @current_round.flatten
    i = flat_current_players.index(id).to_i
    @next_round[i / 4] << id
  end

  def update_rounds
    @current_round = @next_round
    @all_rounds << @current_round
    @next_round = Array.new(current_round.length/2){ Array.new(0) }
  end

end
