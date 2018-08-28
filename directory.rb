def input_students
  
  # create an empty array 
  students = []
  # get the first name
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  name = gets.chomp.to_str
    
  # while the name is not empty, repeat this code
  while !name.empty? do 
    # get the cohort date
    puts "Enter cohort month"
    cohort = gets.chomp
      
    if cohort.empty? 
      cohort = :november
    end
    
  # ask for more information about the student
    puts "Whats #{name}'s favourite hobbie?"
    hobbies = gets.chomp
    puts "Country of birth?"
    birthplace = gets.chomp.to_str
  # add the student hash to the array
    students << {name: name, cohort: cohort, hobbie: hobbies,
    birthplace: birthplace}
    puts "Now we have #{students.count} students"
  # get another name from the user
    puts "Please enter the name of the students"
    name = gets.chomp
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
  puts "Overall, we have #{names.count} great students".center(50)
end 

#nothing happens until we call the methods
 students = input_students
# print_header
# print(students)
print_cohort(sort_into_cohort(students))
# print_footer(students)
