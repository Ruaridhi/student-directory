def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array 
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do 
  # ask for more information about the student
    puts "Whats #{name}'s favourite hobbie?"
    hobbies = gets.chomp
    puts "Country of birth?"
    birthplace = gets.chomp
  # add the student hash to the array
    students << {name: name, cohort: :november, hobbie: hobbies,
    birthplace: birthplace}
    puts "Now we have #{students.count} students"
  # get another name from the user
    name = gets.chomp
  end
  # return the array of students
  students
end
  
def print_header
  puts "The students of Villians Academy"
  puts "_ _ _ _ _ _ _ _ _ _ _"
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
  puts "Overall, we have #{names.count} great students"
end 

#nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)
