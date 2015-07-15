class Game

attr_reader :round_1
attr_reader :players

  def initialize(ids)
    @players = ids
    @round_1 = generate_round_1(ids)
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


  #
  #
  # def winner
  #
  # end

end