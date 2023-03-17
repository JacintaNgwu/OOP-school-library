def controller(user_option)
  puts "\e[32mPlease choose an option by entering a number:\e[0m"
  case user_option
  when '1'
    list_all_books
  when '2'
    list_all_people
  when '3'
    create_person
  when '4'
    create_book
  when '5'
    create_rental
  end
end
