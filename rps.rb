VALID_CHOICES = %w(rock paper scissors)

def prompt(message)
  puts "=> #{message}"
end

loop do
  play_again = ""

  choice = ''
  loop do
    prompt "Choose one: #{VALID_CHOICES.join(', ')}"
    choice = gets.chomp.downcase

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt "That's not a valid choice"
    end
  end

  computer_choice = VALID_CHOICES.sample

  puts "You chose: #{choice}; Computer chose #{computer_choice}"

  if    (choice == 'rock' && computer_choice == 'scissors') ||
        (choice == "paper" && computer_choice == "rock") ||
        (choice == "scissors" && computer_choice == "paper")
    prompt "You won!"
  elsif (choice == 'scissors' && computer_choice == 'rock') ||
        (choice == "rock" && computer_choice == "paper") ||
        (choice == "paper" && computer_choice == "scissors")
    prompt "Computer won"
  else
    prompt "Tie!"
  end

  loop do
    puts "Would you like to play again?"
    puts "Y) Yes    |    N) No"
    play_again = gets.chomp.downcase
    break if %w(y n).include?(play_again)
  end

  break if play_again == "n"
end
