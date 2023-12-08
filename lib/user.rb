
class User
    attr_accessor :shown_word
    def initialize(word)
        @shown_word = String.new
        for i in 0..word.length-1
            @shown_word[i]='_'
        end
        puts @shown_word
    end

    def start
        puts "Welcome to Hangman! You have to guess a given word."
        puts @shown_word
    end

    def self.get_guess
        puts "Guess a letter!"
        gets.chomp
    end

    def show(char, indexes)
        if indexes != nil
            indexes.each do |i|
                @shown_word[i] = char
            end
        else
            puts "The given letter does not exist in the word"
        end
        puts @shown_word
    end

end