# the laser project v0.1
require 'io/console'
system "clear"
selection = ""
times = 0
puts "Welcome, select input -> frequency(F) or a vertebrae(V)?"
while selection = STDIN.noecho(&:getch).chomp.to_s().upcase
    begin
        if selection == "F"
            puts "hello"
            break
        elsif selection == "V"
            puts "goodbye"
            break
        else
            if times < 5
                puts "Sorry, I did not understand that, please select again"
                times +=1
            else
                puts "Are you stupid? I already told you"
                times = 0
            end
        end
    rescue
        puts "Sorry, I did not understand that."
    end
end