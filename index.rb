# the laser project v0.1
require 'io/console'
require 'curses'
require 'json'
begin
data_read = File.read ('./data/data.json')
ha = JSON.parse(data_read)[0]
rescue
    puts "Unable to connect to database"
end
def find_user (ha, str)
    if ha.has_value?(str)
        puts ha["vert"]
    end
    # ha.each do |frec|  
    #   if frec["A+30"] == input 
    #     return find_user
    #   else 
    #     puts "Could not find #{input}"
    #   end 
    # end
end
#   puts find_user(input)

#welcome message
system "clear"
Curses.init_screen
begin
  msg = Curses.stdscr
  x = msg.maxx / 2
  y = msg.maxy / 2
  z = "The Laser Project"
  msg.setpos(y - 3/2, x - (z.length / 2))
  msg.box("X","x")
  msg.addstr(z)
  msg.refresh
  msg.getch
ensure
  Curses.close_screen
end
####
system "clear"
selection = ""
times = 0
frec = false
vert = false
puts "Welcome, select input -> frequency(F) or vertebrae(V)?"

#### Level 1 selection
while selection = STDIN.noecho(&:getch).chomp.to_s().upcase
    begin
        if selection == "F"
            puts "You have selected Frequency"
            frec = true
            break
        elsif selection == "V"
            puts "You have selected Vertebrae"
            vert = true
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
        puts "Sorry, something broke."
        break
    end
end
####
#### Level 2 selection
if frec == true
    puts
    puts "Select frequency from the list"
    find_user(ha, "A+30")
    puts
elsif vert == true
    puts
    puts "Select vertebrae from the list"
    puts
else
    puts "Ups. Something went wrong"
end
####