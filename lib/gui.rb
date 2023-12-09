require File.dirname(__FILE__) + '/colored-master/lib/colored.rb'
class GUI
    def self.logo
        puts "
        __   __  _______  __    _  _______  __   __  _______  __    _ 
        |  | |  ||   _   ||  |  | ||       ||  |_|  ||   _   ||  |  | |
        |  |_|  ||  |_|  ||   |_| ||    ___||       ||  |_|  ||   |_| |
        |       ||       ||       ||   | __ |       ||       ||       |
        |       ||       ||  _    ||   ||  ||       ||       ||  _    |
        |   _   ||   _   || | |   ||   |_| || ||_|| ||   _   || | |   |
        |__| |__||__| |__||_|  |__||_______||_|   |_||__| |__||_|  |__|
        ".bold.blue
        puts "                                       Made in Ruby by Diana"
    end
end