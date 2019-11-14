require 'curses'

Curses.init_screen
begin
  message = Curses.stdscr
  x = message.maxx / 2
  y = message.maxy / 2
  message.setpos(y, x)
  message.addstr("Hello World")
  message.refresh
  message.getch
ensure
  Curses.close_screen
end