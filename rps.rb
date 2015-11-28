VALID_CHOICES = %w(rock paper scissors lizard spock)
VALID_CHOICES_SHORT = %w(r p sc l sp )

def prompt(message)
  puts "=> #{message}"
end

loop do
  play_again = ""

  choice = ''
  loop do
    prompt "Choose one: #{VALID_CHOICES.join(', ')}"
    prompt "Please enter one of the following: "
    prompt VALID_CHOICES_SHORT.join(" ")
    choice = gets.chomp.downcase

    choice = case choice
                when "r"
                  "rock"
                when "p"
                  "paper"
                when "sc"
                  "scissors"
                when "l"
                  "lizard"
                when "sp"
                  "spock"
                else
                  "INVALID"
                end

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt "That's not a valid choice"
    end
  end

  computer_choice = VALID_CHOICES.sample

  puts "You chose: #{choice}; Computer chose #{computer_choice}"

  if    (choice == 'rock' && computer_choice == 'scissors') ||
        (choice == "rock" && computer_choice == "lizard") ||
        (choice == "paper" && computer_choice == "rock") ||
        (choice == "paper" && computer_choice == "spock") ||
        (choice == "scissors" && computer_choice == "paper") ||
        (choice == "scissors" && computer_choice == "lizard") ||
        (choice == "lizard" && computer_choice == "spock") ||
        (choice == "lizard" && computer_choice == "paper") ||
        (choice == "spock" && computer_choice == "rock") ||
        (choice == "spock" && computer_choice == "scissors")
    prompt "You won!"
  elsif (choice == 'scissors' && computer_choice == 'rock') ||
        (choice == "scissors" && computer_choice == "spock") ||
        (choice == "rock" && computer_choice == "paper") ||
        (choice == "rock" && computer_choice == "spock") ||
        (choice == "paper" && computer_choice == "scissors") ||
        (choice == "paper" && computer_choice == "lizard") ||
        (choice == "lizard" && computer_choice == "scissors") ||
        (choice == "lizard" && computer_choice == "rock") ||
        (choice == "spock" && computer_choice == "lizard") ||
        (choice == "spock" && computer_choice == "paper")
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
