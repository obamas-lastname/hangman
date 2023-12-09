require_relative './game_logic.rb'
require_relative './user.rb'

def load_game(game, user)
    puts "Enter name for game you want to load from the following:"
    puts Dir.entries("./saves")
    name = gets.chomp
    info = IO.readlines("saves/#{name}.txt", chomp: true)  
    game.word = info[0];
    user.shown_word = info[1];
    game.guessed = info[2].split;
    game.matched = info[3].to_i;
    game.tries = info[4].to_i;
end

def menu
    puts "Type 1 to open a saved game, type 2 to start a new one. The game auto-saves. Starting a new game will overwrite the last"
    gets.chomp.to_i
end

game = HangmanLogic.new
user = User.new

if menu == 1
    load_game(game, user)
else
    game.new_word
    user.initword(game.word)
end

user.start

while game.tries <= 7
    arr = game.round
    if arr == "save"
        game.save_game(user.shown_word)
        break
    end
    word = user.show(arr[0], arr[1])
    puts word
    if game.won
        puts "Congratulations! You guessed the word"
        break
    end
end

if !game.won && game.tries > 7
    puts "Game over! The word was #{game.word}"
end

