
class User
    attr_accessor :shown_word
    def initialize
        @shown_word = String.new
        #puts @shown_word
    end

    def start
        puts "Welcome to Hangman! You have to guess a given word."
        puts @shown_word
    end

    def initword(word)
        for i in 0..word.length-1
            @shown_word[i]='_'
        end
    end

    def self.get_guess
        puts "Guess a letter or type 'save' to save game"
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
        @shown_word
    end

end
