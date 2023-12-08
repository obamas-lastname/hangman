require_relative './game_logic.rb'
require_relative './user.rb'

game = HangmanLogic.new
user = User.new(game.word)
user.start
for i in 1..7
    while game.won == false
        arr = game.round
        user.show(arr[0], arr[1])
    end
end