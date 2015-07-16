class Game

attr_reader :current_round
attr_reader :players
attr_accessor :next_round

  def initialize(ids)
    @players = ids
    @current_round = generate_round_1(ids)
    @next_round = Array.new(current_round.length/2){ Array.new(0) }
    @round_no = 0
  end

  def tournament_table
    @table = [current_round]
    until @table[-1].length == 1 do
      @table << Array.new(@table[-1].length/2){ Array.new(0) }
    end
    @table << []
    @table
  end

  def fill_tournament_table
    @table
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
    if !@table[-2][0].empty?
      @table[-1][0] = id
      fill_tournament_table
    else
      flat_current_players = @current_round.flatten
      i = flat_current_players.index(id).to_i
      @next_round[i / 4] << id
    end
  end

  def update_rounds
    @round_no += 1
    @table[@round_no] = @next_round
    @current_round = @next_round
    @next_round = Array.new(current_round.length/2){ Array.new(0) }
    fill_tournament_table
  end
  #
  # def winner_name
  # end

end
