require_relative 'app'

def main
  puts "\e[33mWelcome to the School Library App!\e[0m"
  my_app = App.new
  my_app.display_list
end

main
