#a
#Write a method rps_game_winner that takes a two-element list and 
#behaves as follows: - If the number of players is not equal to 2, 
#raise WrongNumberOfPlayersError
#- If either player's strategy is something other than "R", "P" or "S" 
#(case-insensitive), raise NoSuchStrategyError
#- Otherwise, return the name and strategy of the winning player. 
#If both players use the same strategy, the first player is the winner.

class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

def rps_game_winner(game)
  raise WrongNumberOfPlayersError unless game.length == 2
  game.each {|player, move| raise NoSuchStrategyError unless move =~ /(R|P|S)/i }
  #rock beats scissors, scissors beats paper, paper beats rock
  rules = {:r => :p, :p => :s, :s => :r} 
  if rules[game[0][1].downcase.to_sym] == game[1][1].downcase.to_sym
    game[1]
  else
    game[0]
  end
end

def rps_tournament_winner(tournament)
   if tournament[0][0].kind_of? Array
     return rps_tournament_winner( [rps_tournament_winner(tournament[0]) , rps_tournament_winner(tournament[1])] )
  else
     return rps_game_winner(tournament)
  end
end

#p rps_game_winner([[ "Armando", "P" ], [ "Dave", "s" ]])
#tournament = [[[["Armando","P"],["Dave", "S"]], [["Richard","R"],["Michael","S"]],],[[["Allen","S"],["Omer","P"]],[["Dave E.","R"],["Richard x.","P"]]]]
#p rps_tournament_winner(tournament)
