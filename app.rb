require_relative 'student_class'
require_relative 'teacher_class'
require_relative 'book_class'
require_relative 'rental_class'
require_relative 'control'

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def colorize_output(color_code, statements)
    puts "\e[#{color_code}m#{statements}\e[0m"
  end

  def colorize_outprint(color_code, statements)
    print "\e[#{color_code}m#{statements}\e[0m"
  end

  def list_all_books
    if @books.empty?
      colorize_output(23, 'Please enter books first!!')
    else
      @books.each do |book|
        puts "Title: #{book.title}, Author: #{book.author}"
      end
    end
    display_list
  end

  def list_all_people
    if @people.empty?
      colorize_output(31, 'Please enter people first!!')
    else
      @people.each do |person|
        puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    end
    display_list
  end

  def create_person
    colorize_outprint(35, 'Do you want to create a student (1) or a teacher (2)? [Input the number]: ')
    choice = gets.chomp.to_i
    case choice
    when 1
      create_student
    when 2
      create_teacher
    else
      colorize_output(31, 'Invalid choice')
    end
  end

  def create_student
    colorize_outprint(35, 'Name: ')
    name = gets.chomp
    colorize_outprint(35, 'Age: ')
    age = gets.chomp
    colorize_outprint(35, 'Has parent permission? [Y/N]: ')
    permission = gets.chomp.downcase
    case permission
    when 'y' then parent_permission = true
    when 'n' then parent_permission = false
    end
    student = Student.new(age: age, name: name, parent_permission: parent_permission)
    @people.push(student)
    colorize_output(34, 'Person Student Created successfully')
    display_list
  end

  def create_teacher
    colorize_outprint(35, 'Name: ')
    name = gets.chomp
    colorize_outprint(35, 'Age: ')
    age = gets.chomp
    colorize_outprint(35, 'Specialization: ')
    specialization = gets.chomp
    @people.push(Teacher.new(age: age, name: name, specialization: specialization))
    colorize_output(34, 'Person Teacher Created successfully')
    display_list
  end

  def create_book
    colorize_output(36, 'Enter Book details')
    colorize_outprint(35, 'Title: ')
    title = gets.chomp

    colorize_outprint(35, 'Author: ')
    author = gets.chomp

    @books.push(Book.new(title, author))

    colorize_output(36, 'You have successfully created your book')
    display_list
  end

  def list_all_books_with_numbers
    if @books.empty?
      colorize_output(34, 'Please enter books first!')
      display_list
    else
      @books.each_with_index do |book, index|
        puts "#{index}) Title: #{book.title}, Author: #{book.author}"
      end
    end
  end

  def list_all_person_with_numbers
    if @people.empty?
      colorize_output(34, 'Please enter people first!!')
      display_list
    else
      @people.each_with_index do |person, index|
        puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    end
  end

  def create_rental()
    colorize_output(36, 'Select a book from the following list by number')
    list_all_books_with_numbers
    book_option = gets.chomp.to_i

    colorize_output(36, 'Select a person from the following list by number (not id)')
    list_all_person_with_numbers
    person_option = gets.chomp.to_i

    colorize_outprint(36, 'Date: ')
    date = gets.chomp
    @rentals.push(Rental.new(date, @books[book_option], @people[person_option]))
    colorize_output(36, 'Rental created successfully')
    display_list
  end

  def list_rentals_of_person_id()
    print 'Person ID: '
    person_id = gets.chomp.to_i
    person = @people.find { |human| human.id == person_id }

    rentals = @rentals
    rentals.each do |rental|
      puts "Date: #{rental.date}, Book '#{rental.person.title}' by #{rental.person.author}" if rental.book == person
    end
    display_list
  end

  def display_list
    puts ' '
    puts 'Please choose an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
    user_option = gets.chomp
    if user_option == '6'
      list_rentals_of_person_id
    elsif user_option == '7'
      exit
    else
      controller(user_option)
    end
  end
end
