@students = [] #empty array accessible to all methods

def input_students
  # create an empty array 
  #students = []
  # get the first name
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  name = STDIN.gets
  name.delete!("\n")  
  # while the name is not empty, repeat this code
  while !name.empty? do 
  # add the student hash to the array
    @students << {name: name, 
    cohort: :november,}
    puts "Now we have #{@students.count} students"
  # get another name from the user
    puts "Please enter the name of the students"
    name = STDIN.gets
    name.delete!("\n")
  end
  # return the array of students
  #students(not required now been
  #refactored to have students as a
  #global variable)
end

def interactive_menu
  loop do
    # 2. read the input and save it into a variable
    print_menu
    process(STDIN.gets.chomp)
    # 3. do what the user has asked
  end
end

def print_menu
# 1. print the menu and ask the user what to do
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def show_students 
#Show students_by_cohort
  print_header
  print_student_list
  #print_cohort(sort_into_cohort)   
  print_footer
end

def save_students
# open the file for writing
  file = File.open("students.csv", "w")
# iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line| 
  name, cohort = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end

def try_load_students
  filename = ARGV.first #first argument from the commmand line
  return if filename.nil? #get out of the method if it isn't given
  if File.exits?(filename) # if it exist
    load_students(filename)
      puts "loaded #{@students.count} from #{filename}"
  else # if doesn't exist
    puts "sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end


def process(selection)
  case selection
    when "1" 
#input students
      input_students
    when "2"
      show_students  
    when "3"
      save_students
    when "4"
      load_students
    when "9"
      exit #will exit the program
    else
      puts "I don't know what you meant, try again"
  end
end
  
def print_header
  puts "The students of Villians Academy".center(50)
  puts "_ _ _ _ _ _ _ _ _ _ _".center(50)
end

def print_student_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end  

def print_footer
  puts "Overall, we have #{@students.count} great students".center(50)
end 

try_load_students
#nothing happens until we call interactive_menu
interactive_menu



 