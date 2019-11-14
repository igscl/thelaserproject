# the laser project v0.1
require 'io/console'
require 'curses'
require 'json'
fsearch = ""
begin
    data_read = File.read ('./data/data.json')
    ha = JSON.parse(data_read)

rescue
    puts "Unable to connect to database"
end
# def find_user (ha, str)
#     if ha.has_value?(str)
#         ha.each do |k, v|
#             if k == "vert"
#                 puts ha["vert"]
#             end
#         end
#     end
def find_user (ha, input)
    found_users = []
    ha.each do |item|  
      if item["frec"] == input 
        found_users.push(item)
      end 
    end
    unless found_users.length < 1
        for i in found_users do
            puts i["vert"] 
        end
    else 
        return "Sorry, could not find #{fsearch}"
    end
end

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
    puts "Please input frequency"
    fsearch = gets.chomp.to_s().upcase
    begin
        puts
        puts "Frequency #{fsearch} should be present in:"
        puts
        find_user(ha, fsearch)
        rescue
            puts "Sorry, could not find #{fsearch}, please try again"
    end
    puts
elsif vert == true
    puts
    puts "Select vertebrae from the list"
    puts
else
    puts "Ups. Something went wrong"
end
####