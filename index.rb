# the laser project v0.1
require 'io/console'
require 'curses'
require 'json'
require 'colorize'
require 'tty-prompt'
fsearch = ""
vsearch = ""
begin
    data_read = File.read ('./data/data.json')
    ha = JSON.parse(data_read)

rescue
    puts "Unable to connect to database"
end
### frequency search
def find_user (ha, input)
    found_users = []
    ha.each do |item|  
      if item["frec"] == input 
        found_users.push(item)
      end 
    end
    unless found_users.length < 1
        for i in found_users do
            puts "#{i["location"]} Band and Column"
            puts "#{i["vert"]} in the Central Nervous System which relates to #{i["ver_rel"]}"
        end
    else 
        return "Sorry, could not find #{fsearch}"
    end
end
####
### vertebrae search
def find_userv (ha, input)
    found_usersv = []
    ha.each do |item|  
      if item["vert"] == input 
        found_usersv.push(item)
      end 
    end
    unless found_usersv.length < 1
        for i in found_usersv do
            puts "Frequency #{i["frec"]} and #{i["location"]} in Central Nervous System".colorize(:green)
            puts "#{i["vert"]} relates to #{i["ver_rel"]}".colorize(:green)
        end
    else 
        return "Sorry, could not find #{vsearch}"
    end
end
####
### Animation
def animation1
    1.times do
      i = 1
      while i < 7
        print "\033[2J"
        File.foreach("./animation/#{i}.rb") { |f| puts f }
        sleep(0.3)
        `afplay ./audio/blaster3.wav`
        i += 1
        # if STDIN.noecho(&:getch).chomp.to_s()
      end
      `afplay ./audio/scream.wav`
    end
    puts
    puts
end
####
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
  

#### animation2
  2.upto(msg.maxx - 3) do |i|
    msg.setpos(msg.maxy / 2, i)
    msg << "~ "
    msg.refresh
    sleep 0.01 
  end
######
#### sound
`afplay ./audio/blaster.wav`

####
#   msg.getch

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
    # fsearch = gets.chomp.to_s().upcase
    

prompt = TTY::Prompt.new
letters = ('A'..'G').to_a
selection = prompt.select("Choose your octave:", letters, per_page: 7)

frequency_data = ["-30", "-20", "-10", "-0","+10", "+20", "+30"]
selection2 = prompt.select("Now choose your frequency:", frequency_data, per_page: 7)

fsearch = selection + selection2

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
    puts "Please input vertebrae"
    # vsearch = gets.chomp.to_s().upcase
    prompt2 = TTY::Prompt.new
    vsearch_data = ["C1","C2","C3","C4","C5","C6","C7","T1","T2","T3","T4","T5","T6","T7","T8","T9","T10","T11","T12","L1","L2","L3","L4","L5","S1","S2","S3","S4","S5","Coccyx"]
    vsearch = prompt2.select("Choose your vertebrae:", vsearch_data, per_page: 7)


    
        begin
        puts
        puts "Vertebrae #{vsearch} data:"
        puts
        find_userv(ha, vsearch)
        puts
        puts "Want to see the map? Y/N"
        ### MAP SELECTION
        timesyesno = 0
        while yesno = STDIN.noecho(&:getch).chomp.to_s().upcase
            begin
                if yesno == "Y"
                    animation1
                    frec = true
                    break
                elsif yesno == "N"
                    puts
                    vert = true
                    break
                else
                    if timesyesno < 5
                        puts "Sorry, I did not understand that, please select again"
                        timesyesno +=1
                    else
                        system "clear"
                        puts "It seems to me you're not understanding, goodbye"
                        break
                    end
                end
            rescue
                puts "Sorry, something broke."
                break
            end
        end
        ###
    
        rescue
            puts "Sorry, could not find #{vsearch}"
            puts
    end

else
    puts "Ups. Something went wrong"
end
####