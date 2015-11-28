# Build a command line calculator program that does the following:
# asks for two numbers
# asks for the type of operation to perform: add, subtract, multiple or divide
# displays the result

def prompt
  print ">> "
end

# Validate user input
def check_num(num_to_check)
  true if num_to_check.to_f.to_s == num_to_check || num_to_check.to_i.to_s == num_to_check
end

begin
  begin
    puts "Please give me the first number"
    print ">> "
    first_num = gets.chomp
  end until check_num first_num
  puts "The first number is: #{first_num}"

  begin
    puts "Please give me the second number"
    prompt
    second_num = gets.chomp
  end until check_num second_num

  puts "The second number is #{second_num}"
  puts "What would you like to do?"
  puts "1) add"
  puts "2) subtact"
  puts "3) multiply"
  puts "4) divide"
  prompt

  operator = gets.chomp
  operators = %w(1 2 3 4)

  until operators.include?(operator)
    puts "The second number is #{second_num}"
    puts "What would you like to do?"
    puts "1) add"
    puts "2) subtact"
    puts "3) multiply"
    puts "4) divide"
    prompt
    operator = gets.chomp
  end

  case operator
  when "1"
    puts "#{first_num} plus #{second_num} equals:"
    puts first_num.to_f + second_num.to_f
  when "2"
    puts "#{first_num} minus #{second_num} equals:"
    puts first_num.to_f - second_num.to_f
  when "3"
    puts "#{first_num} multiplied by #{second_num} equals:"
    puts first_num.to_f * second_num.to_f
  when "4"
    puts "#{first_num} divided by #{second_num} equals:"
    puts first_num.to_f / second_num.to_f
  else
    puts "Error!"
  end

  begin
    puts ""
    puts "Enter another computation?"
    puts "Y) Yes"
    puts "N) No"
    prompt
    keep_going = gets.chomp.upcase
  end until %w(Y N).include? keep_going

end until keep_going == "N"
