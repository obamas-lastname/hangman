require_relative './user.rb'

class HangmanLogic
    attr_accessor :word, :won, :matched, :guessed, :tries
    def initialize
        @matched = 0
        @won = false
        @guessed = Array.new(8)
        @tries = 0
    end

    def new_word
        word = File.readlines("./words.txt").sample
        if word.length < 5 || word.length > 12
            @word = new_word
        else
            @word = word.chomp
        end
    end
    
    def save_game(gword)
        Dir.mkdir('saves') unless Dir.exist?('saves')
        puts "Enter name for the game you wish to save:"
        name = gets.chomp
        filename = "saves/#{name}.txt"
    
        File.open(filename, 'w') do |file|
            file.puts @word
            file.puts gword
            file.puts @guessed.join(" ")
            file.puts @matched
            file.puts @tries
        end
    end

    def guess(char)
        indices = (0...@word.length).find_all { |i| @word[i] == char }
        indices.empty? ? nil : indices
    end
    

    def round
        puts "Letters already guessed:"
        puts @guessed.join(" ")
        puts "You have #{7-@tries} wrong guesses left"
        guessed_char = User.get_guess
        puts "++++++++++++++++++++++++++++++++++++"
        if guessed_char != "save"
            @guessed << guessed_char
            indices = guess(guessed_char)
            if indices
                @matched += indices.length 
            else
                @tries = @tries+1
            end
            if @matched == @word.length
                @won = true 
            end
            return [guessed_char, indices]
        else
            "save"
        end
    end
    
end
