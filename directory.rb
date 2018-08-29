def input_students
  
  # create an empty array 
  students = []
  # get the first name
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  name = gets.to_str
  name.delete!("\n")  
  # while the name is not empty, repeat this code
  while !name.empty? do 
    # get the cohort date
    puts "Enter cohort month"
    cohort = gets
    cohort.delete!("\n")
      
    if cohort.empty? 
      cohort = :november
    end

  # ask for more information about the student
    puts "Whats #{name}'s favourite hobbie?"
    hobbies = gets
    hobbies.delete!("\n")
    puts "Country of birth?"
    birthplace = gets.to_str
    birthplace.delete!("\n")
  # add the student hash to the array
    students << {name: name, cohort: cohort, hobbie: hobbies,
    birthplace: birthplace}
    puts "Now we have #{students.count} students"
  # get another name from the user
    puts "Please enter the name of the students"
    name = gets
    name.delete!("\n")
  end
  # return the array of students
  students
end



def sort_into_cohort(students)
  sorted_cohort = {}
  students.each do |student|
    month = student[:cohort]
    if sorted_cohort[month.to_sym] == nil  
      sorted_cohort[month.to_sym] = [student[:name]]
    else 
      name_array = sorted_cohort[month.to_sym]
      name_array.push(student[:name])
      sorted_cohort[month.to_sym] = name_array 
    end 
  end 
  sorted_cohort
end 

def print_cohort(students_by_cohort)
  students_by_cohort.each do |month, names|
    puts month.to_s + ":"
    puts names
  end 
end 

def interactive_menu
students = []
  loop do
      # 1. print the menu and ask the user what to do
      puts "1. Input the students"
      puts "2. Show the students"
      puts "9. Exit"
    # 2. read the input and save it into a variable
      selection = gets.chomp.to_i
    # 3. do what the user has asked
      case selection
        when 1 
          #input students
          students = input_students
        when 2
          #Show students_by_cohort
          print_header
          # print(students)
          print_cohort(sort_into_cohort(students))   
          print_footer(students)
        when 9
          exit #will exit the program
        else
          puts "I don't know what you meant, try again"
      end
      
  end
end

interactive_menu
  
def print_header
  puts "The students of Villians Academy".center(50)
  puts "_ _ _ _ _ _ _ _ _ _ _".center(50)
end

def print(students)
  index = 0
  while index <= students.length-1
    puts "#{index + 1} #{students[index][:name]}" + 
    " Main Hobbie: #{students[index][:hobbie]}" + 
    " Birthplace: #{students[index][:birthplace]}" +
    " (#{students[index][:cohort]} cohort)"
    index +=1
  end
end  



def print_footer(names)
  if names.count === 1
    puts "Overall, we have #{names.count} great student".center(50)
  else
    puts "Overall, we have #{names.count} great students".center(50)
  end
end 

#nothing happens until we call the methods

if !sort_into_cohort(students).empty?

else
  
end