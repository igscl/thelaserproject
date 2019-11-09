# the laser project v0.1
require 'io/console'
system "clear"

puts "Welcome, select input -> frequency(F) or a vertebrae(V)?"
selection = STDIN.noecho(&:getch).chomp.to_s().upcase
    if selection == "F"
        puts "hello"
    elsif selection == "V"
        puts "goodbye"
    end
