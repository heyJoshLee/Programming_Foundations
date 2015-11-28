
def number_okay?(number)
  number.to_i.to_s == number || number.to_f.to_s == number
end

keep_going = ""
loop do
  loan_amount = ""
  loop do
    puts "Enter your loan's principal amount in whole dollars"
    loan_amount = gets.chomp
    break if number_okay? loan_amount
  end

  apr = ""
  loop do
    puts "Enter your loan's APR (Annual Percentage Rate)"
    puts "Ex. For 12% enter 12"
    puts "Ex. for 12.5% please enter 12.5"
    apr = gets.chomp
    # TODO: Check for wierd inputs like 0.34 and .32
    break if number_okay? apr
  end

  duration_in_months = ""
  loop do
    puts "Please enter your loan's duration in MONTHS"
    duration_in_months = gets.chomp
    # TODO: Check for single digit input numbers
    break if number_okay? duration_in_months
  end

  monthly_rate = apr.to_f / 100 / 12.0

  # P = L[c(1 + c)n]/[(1 + c)n - 1]
  payment = loan_amount.to_f * (monthly_rate /
    (1 - (1 + monthly_rate)**-duration_in_months.to_i))
  puts payment

  loop do
    puts "Would you like to do another calculation?"
    puts "Y) Yes   |   N) No"
    keep_going = gets.chomp.upcase
    break if %w(Y N).include? keep_going
  end

  break if keep_going == "N"
end
