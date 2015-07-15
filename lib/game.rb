class Game

attr_accessor :round_1
attr_reader :players
attr_accessor :next_round

  def initialize(ids)
    @players = ids
    @round_1 = generate_round_1(ids)
    @next_round = Array.new(round_1.length/2){ Array.new(0) }
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
    2 ** ((Math.log(players.length, 2)).ceil)
  end

  def byes
    gamesize - players.length
  end

  def winner(id)
    flat_current_players = @round_1.flatten
    i = flat_current_players.index(id).to_i
    @next_round[i / 4] << id
  end






#
#   make next round array with right number of subarrays.
#
#   def place_winners(id)
#     i  = first_round_players.index(player)
#     if i = 0 or 1 { next_round[0] << player}
#     if i = 2 or 3 { next_round[1] << player}
#     if i = 4 or 5 { next_round[2] << player}
#       ......
#
# end
#
# def addwinner(id)
#   next_round << id
# end
#
# def next_round
# when next_round = sasdfasdf
#   sort next round
# end
#
# def sort next round
#
end
