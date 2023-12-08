require_relative './user.rb'

class HangmanLogic
    attr_accessor :word, :won, :matched, :guessed
    def initialize
        @word = pick_random_line
        @matched = 0
        @won = false
        @guessed = Array.new(8)
    end

    def pick_random_line
        word = File.readlines("./words.txt").sample
        if word.length < 5 || word.length > 12
            pick_random_line
        else
            word.chomp
        end
    end
    

    def guess(char)
        indices = (0...@word.length).find_all { |i| @word[i] == char }
        indices.empty? ? nil : indices
    end
    

    def round
        puts "Letters already guessed:"
        puts @guessed.join(" ")
        guessed_char = User.get_guess
        @guessed << guessed_char
        indices = guess(guessed_char)
        @matched += indices.length if indices
        @won = true if @matched == @word.length
        return [guessed_char, indices]
    end
    
end
